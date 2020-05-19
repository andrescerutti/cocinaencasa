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
    status_color = { pending: '#fd1015', on_transit: '#eeff00', delivered: '#4dc433', canceled: '#ff9900', refunded: '#23264D' }
    @orders = Order.select("MAX(orders.id) as id, date_delivery").includes(:payment).joins(kit: { restaurant: :user }).where(users: { id: current_user.id }).where(payments: { status: "approved" }).group("orders.date_delivery") #order("orders.date_delivery ASC")
    # stores_ids = Order.select("MAX(stores.id) as id, stores.name").joins(:restaurant).where(restaurants: {id: @restaurant.id }).group("stores.name").having("count(*) > 0").map { |s| s.id }
    # .where("orders.date_delivery > ?", Date.today - 1)
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
