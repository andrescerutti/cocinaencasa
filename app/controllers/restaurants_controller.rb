class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.friendly.find(params[:id])
    authorize @restaurant
  end

  def edit
  end

end
