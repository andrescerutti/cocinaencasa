class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @store = Store.find(params[:id])
    @restaurant = @store.restaurant
    @kits = @store.restaurant.kits
    authorize @store
  end

  def update
    @store = Store.find(params[:id])
    @store.update(store_params)
    authorize @store
    if @store.save
      redirect_to stores_admin_path
    end
  end

  private

  def store_params
    params.require(:store).permit(:polygon)
  end
end
