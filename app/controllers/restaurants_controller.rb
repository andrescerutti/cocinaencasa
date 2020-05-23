class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.friendly.find(params[:id])
    stores_ids = Store.select("MAX(stores.id) as id, stores.name").joins(:restaurant).where(restaurants: {id: @restaurant.id }).group("stores.name").having("count(*) > 0").map { |s| s.id }
    @stores = Store.where(id: stores_ids)
    redirect_to store_path(@stores.first) if @stores.count === 1
    authorize @restaurant
  end

  def edit
  end

end
