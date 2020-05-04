class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @store = Store.find(params[:id])
    @restaurant = @store.restaurant
    authorize @store
  end
end
