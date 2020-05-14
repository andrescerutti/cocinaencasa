class PaymentsController < ApplicationController
  protect_from_forgery except: :create

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
    @payment = MercadoPagoHelper::create(params, @order, @restaurant.prod_mp_private_key)
    if @payment
      authorize @payment
      if @payment.status == "approved"
        @kit.stock -= @order.amount
        @kit.save
        redirect_to order_payment_path(@order, @payment)
      else
        @payment.save
        authorize @payment
        UserMailer.with(user: current_user, order: @order, payment: @payment, store: @store).error_on_buying.deliver_now
        redirect_to failed_path(@order.id)
      end
    else
      @data = {"issuer_id"=> payment_params["issuer_id"], "installments"=> payment_params["installments"], "payment_method_id"=> payment_params["payment_method_id"], "payer_id"=> payment_params["payer_id"], "payer_type"=> payment_params["payer_type"]}
      UserMailer.with(user: current_user, order: @order, store: @store, data: @data).error_on_buying.deliver_now
      redirect_to failed_path(@order.id)
    end
  end

  private

  def payment_params
    params.permit("issuer_id", "installments", "payment_method_id", "payer_id", "payer_type")
  end
end
