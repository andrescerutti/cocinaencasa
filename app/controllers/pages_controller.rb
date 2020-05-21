class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :wrong_address]

  def home
    redirect_to welcome_path(query: {address: session[:address]}) if session[:address].present?
    @categories = Category.all
  end

  def components
  end

  def contact

  end

  def user_dashboard
    @restaurants = Restaurant.all
    @kits = Kit.all
    @orders = Order.where(user: current_user)
    @payments = Payment.where(order: @orders)
    @pages = "asd"
    authorize :page, :user_dashboard?
  end

  def admin_dashboard
    delivery_day = Proc.new {|order| order.date_delivery.in_time_zone("Buenos Aires").strftime("%A %d-%b") }
    @restaurant = current_user.restaurants.first
    orders = Order.includes(:payment).joins(kit: { restaurant: :user }).where(users: { id: current_user.id }).where(payments: { status: "approved" }).order("orders.date_delivery ASC").where("orders.date_delivery > ?", Date.today.in_time_zone("Buenos Aires") - 1.day )
    @past_orders = Order.includes(:payment).joins(kit: { restaurant: :user }).where(users: { id: current_user.id }).where(payments: { status: "approved" }).order("orders.date_delivery ASC").where("orders.date_delivery <= ?", Date.today.in_time_zone("Buenos Aires") - 1.day ).where("orders.date_delivery > ?", Date.today.in_time_zone("Buenos Aires") - 5.day ).group_by(&delivery_day)
    orders_by_status = orders.group_by { |order| order.status }
    @orders_by_store = orders.group_by { |order| order.store_id }.map { |store_id, orders| [Store.find(store_id).name, orders.count {|order| order.status == "pending" }, orders.count {|order| order.status == "on_transit" }, orders.count {|order| order.status == "delivered" }, orders.count {|order| order.status == "canceled" }, orders.count {|order| order.status == "refunded" }, { amount: orders.select { |order| !order.payment.cash }.reduce(0) {|acum, order| acum + order.amount * order.kit.price }, quantity: orders.count {|order| !order.payment.cash } }, { amount: orders.select { |order| order.payment.cash }.reduce(0) {|acum, order| acum + order.amount * order.kit.price }, quantity: orders.count {|order| order.payment.cash } } ] }
    @pending_orders = orders_by_status["pending"].group_by(&delivery_day)  if orders_by_status.key?("pending")
    @on_transit_orders = orders_by_status["on_transit"].group_by(&delivery_day) if orders_by_status.key?("delivered")
    @delivered_orders = orders_by_status["delivered"].group_by(&delivery_day) if orders_by_status.key?("delivered")
    @canceled_orders = orders_by_status["canceled"].group_by(&delivery_day) if orders_by_status.key?("canceled")
    @refunded_orders = orders_by_status["refunded"].group_by(&delivery_day) if orders_by_status.key?("refunded")
    @pending_orders ||= {}
    @on_transit_orders ||= {}
    @delivered_orders ||= {}
    @canceled_orders ||= {}
    @refunded_orders ||= {}
  end

  def stores_admin
    @stores = Store.joins(:restaurant).where("restaurants.user_id = ?", current_user.id).order("stores.id ASC")
  end

  def wrong_address
    coordinates = Geocoder.search(params[:query])
    if coordinates.empty?
      coordinates = request.location
    else
      @markers = [{
        lat: coordinates.first.latitude,
        lng: coordinates.first.longitude,
        color: '#4C9E7D'
      }]
    end
  end
end
