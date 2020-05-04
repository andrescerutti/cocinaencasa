class KitsController < ApplicationController
  before_action :set_kit, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :category, :new, :create, :update_stock]
  def index
    # 1. Geocode Address from params (Mapbox o Nominatum)
    # 2. Si hay restaurants, proceso normal, sino redirect to wrong_address
    policy_scope(Kit)
    @categories = Category.all
    # @restaurants = Restaurant.geocoded
    @user = current_user
    @search = params[:query][:address]
    session[:address] = params[:query][:address]
    @kits = Kit.near(@search, 8, select: "addresses.*, kits.*").joins(restaurant: {stores: :address})
    return redirect_to wrong_address_path(query: @search) if @kits.empty?
    @stores = Store.near(@search, 8, select: "addresses.*, stores.*").joins(:restaurant).joins(:address)
  end

  def show
    @kits = Kit.near(session[:address], 8, select: "addresses.*, kits.*").joins(restaurant: {stores: :address})
    @kit = Kit.find(params[:id])
    @store = Store.near(session[:address], 8, select: "addresses.*, stores.*").joins(:restaurant).joins(:address).where(restaurant: @kit.restaurant).first
    @order = Order.new
    @order.build_address
    @disable_days = @store.disabled
  end

  def new # SOLO LOS ADMINS PUEDE CREAR
    @kit = Kit.new
    @user = current_user
    authorize @kit
    # autorizar que solo los admins puedan acceder
  end

  def create
    @kit = Kit.new(kit_params)
    @kit_ingredient = KitIngredient.new(kit_id: @kit)
    @kit_cookware = KitCookware.new(kit_id: @kit)
    authorize @kit
    @guide = Guide.new(video: "PeFJlk8eOhQ")
    if @kit.save!
      @guide.kit = @kit
      @guide.save
      return redirect_to @kit
    end
    render :new
  end

  def edit
  end

  def update
    return redirect_to @kit if @kit.update(kit_params)

    render :edit
  end

  def category
    @kits = Kit.joins(kit_categories: :category).where("categories.name = ?", params[:name])
    authorize @kits
    @category = params["name"]
  end

   def destroy
    @kit.destroy
    redirect_to admin_dashboard_path
  end

  private

  def set_kit
    @kit = Kit.find(params[:id])
    authorize @kit
  end

  def kit_params
    params.require(:kit).permit(:name, :stock, :price, :size, :preparation_time, :image, :description, :restaurant_id)
  end
end
