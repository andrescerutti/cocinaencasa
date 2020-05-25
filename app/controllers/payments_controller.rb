class PaymentsController < ApplicationController
  protect_from_forgery except: :create
  skip_after_action :verify_authorized

  def failed
    @order = Order.find(params[:id])
    @store = Store.find(@order.store_id)
    @kit = @order.kit
  end

  def show
    @order = Order.find(params[:order_id])
    @payment = Payment.find(params[:id])
    @cookwares = Cookware.all
    authorize @payment
  end

  def create
    @order = Order.find(params["order_id"])
    @kit = @order.kit
    @store = Store.find(@order.store_id)
    @restaurant = @order.kit.restaurant

    if params["payment"].present? && params["payment"]["cash"].present? && params["payment"]["cash"] == "true"
      @kit.stock -= @order.amount
      @kit.save
      @payment = Payment.new(status: "approved", cash: true, dni: cash_params["dni"], date_approved: Time.now.to_s, operation_type: "cash", order: @order, payment_method_id: "cash", payment_type_id: "cash", status_detail: "approved", total: @kit.price * @order.amount * (100 - @store.discount) / 100)
      @payment.save
      authorize @payment
      # PaymentMailer.with(user: current_user, payment: @payment, store: @store).confirmed.deliver_now
      # RestaurantSaleMailer.with(user: current_user, order: @order, payment: @payment, restaurant: @restaurant, store: @store).new_sale.deliver_now
      redirect_to order_payment_path(@order, @payment)
    else
      @payment = MercadoPagoHelper::create(params, @order, @restaurant.prod_mp_private_key)
      if @payment
        if @payment.status == "approved"
          @kit.stock -= @order.amount
          @payment.total = @kit.price * @order.amount
          @payment.save
          @kit.save
          authorize @payment
          # PaymentMailer.with(user: current_user, payment: @payment, store: @store).confirmed.deliver_now
          # RestaurantSaleMailer.with(user: current_user, order: @order, payment: @payment, restaurant: @restaurant, store: @store).new_sale.deliver_now
          redirect_to order_payment_path(@order, @payment)
        else
          UserMailer.with(user: current_user, order: @order, store: @store).error_on_buying.deliver_now
          redirect_to failed_path(@order.id)
        end
      else
        @data = {"issuer_id"=> payment_params["issuer_id"], "installments"=> payment_params["installments"], "payment_method_id"=> payment_params["payment_method_id"], "payer_id"=> payment_params["payer_id"], "payer_type"=> payment_params["payer_type"]}
        UserMailer.with(user: current_user, order: @order, store: @store, data: @data).error_on_buying.deliver_now
        redirect_to failed_path(@order.id)
      end
    end
  end

  private

  def payment_params
    params.permit("issuer_id", "installments", "payment_method_id", "payer_id", "payer_type")
  end

  def cash_params
    params["payment"].permit("dni")
  end
end
