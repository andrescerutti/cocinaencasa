class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :wrong_address]

  def home
    @categories = Category.all
  end

  def components
  end

  def contact

  end

  def user_dashboard
    # @brands = Brand.find(1..5)
    @restaurants = Restaurant.all
    @kits = Kit.all
    @orders = Order.where(user: current_user)
    @payments = Payment.where(order: @orders)
    @pages = "asd"
    authorize :page, :user_dashboard?
  end

  def admin_dashboard
    status_color = { pending: '#fd1015', on_transit: '#eeff00', delivered: '#4dc433', canceled: '#ff9900', refunded: '#23264D' }
    @orders = Order.joins(kit: {restaurant: :user}).where(users: {id: current_user.id})
    @kits = Kit.joins(restaurant: :user).where(users: {id: current_user.id})
    # @markers = @orders.map do |order|
    #   {
    #     lat: order.address.latitude,
    #     lng: order.address.longitude,
    #     # infoWindow: render_to_string(partial: "infowindow", locals: { order: order }),
    #     color: status_color[order.status.to_sym]
    #   }
    # authorize :page, :admin_dashboard?
    # end
  end

  def wrong_address
    coordinates = Geocoder.search(params[:query])
    if coordinates.empty?
      coordinates = request.location
    else
      @markers = [{
        lat: coordinates.first.latitude,
        lng: coordinates.first.longitude,
        color: '#0A60C4'
      }]
    end
  end
end
