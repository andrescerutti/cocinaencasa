class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :order_assignment]

  def index
    @orders = Order.all
  end

  def show
    @order.user = current_user
    @store = Store.find(@order.store_id)
    if @order.pick_up
      @address = Address.new(address: @store.address.address)
      @order.address = @address
      @order.save
      @address.save
    elsif session[:address].present? || session[:flat_number].present?
      @address = Address.new(address: session[:address], flat_number: session[:flat_number])
      @order.address = @address
      @order.save
      @address.save
      current_user.addresses << Address.new(address: session[:address], flat_number: session[:flat_number])
      current_user.save
    end
    @kit = @order.kit
    @store = Store.find(@order.store_id)
    @ingredients = Ingredient.joins(kit_ingredients: :kit).where("kits.id = ?", @kit.id)
    @cookwares = Cookware.joins(kit_cookwares: :kit).where("kits.id = ?", @kit.id)
  end

  def new
    @kit = Kit.find(params[:kit_id])
    @order = Order.new(amount: params[:order][:amount])
    authorize @order
  end

  def create
    @order = Order.new(orders_params)
    @order.user = current_user
    @order.kit = Kit.find(params[:kit_id])
    @order.code = "#{@order.kit_id}-#{rand(0..1000000)}"
    if params[:order][:addresses].present?
      session[:address] = params[:order][:addresses][:address]
      session[:flat_number] = params[:order][:addresses][:flat_number]
    end
    @payment = Payment.new
    @payment.order = @order
    authorize @order
    if @order.save
      redirect_to @order
    else
      render @order.kit
    end
  end

  def edit
  end

  def update
    @order.update(orders_params)
    redirect_to admin_dashboard_path
  end

  def order_assignment
    @order.update(orders_params) if params[:order].present?
    if @order.save
      flash[:notice] = "La orden a sido asignada a #{@order.delivery_provider} statisfactoriamente."

      if @order.status == "on_transit"
        mail = OrderReadyMailer.with(user: current_user.email, order: @order).order_ready
        mail.deliver_now
      end

      return redirect_to admin_dashboard_path
    end
    flash[:alert] = "La orden no pudo ser sido asignada a #{@order.delivery_provider}."
    return redirect_to admin_dashboard_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def orders_params
    params.require(:order).permit(:store_id, :amount, :delivery_provider, :status, :date_delivery, :code, :reason, :reference_number, addresses_atributes: [:address])
  end

  def address_params
    params[:order][:addresses].permit(:address, :city, :street, :state, :flat_number, :cp)
  end
end
