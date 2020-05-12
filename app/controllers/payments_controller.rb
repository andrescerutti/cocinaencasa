class PaymentsController < ApplicationController
  protect_from_forgery except: :create

  def failed
    @order = Order.find(params[:id])
    @store = Store.find(@order.store_id)
    @kit = @order.kit
    authorize :payment, :failed?
  end

  def show
    @order = Order.find(params[:order_id])
    @payment = Payment.find(params[:id])
    @cookwares = Cookware.all
    authorize @payment
  end

  def create
    @order = Order.find(params["order_id"])
    @store = Store.find(@order.store_id)
    @restaurant = @order.kit.restaurant
    @payment = MercadoPagoHelper::create(params, @order, @restaurant.prod_mp_private_key)
    @payment.save
    authorize @payment
    if @payment.status == "approved"
      redirect_to order_payment_path(@order, @payment)
    else
      UserMailer.with(user: current_user, order: @order, payment: @payment, store: @store).error_on_buying.deliver_now
      redirect_to failed_path(@order.id)
    end
  end
end
