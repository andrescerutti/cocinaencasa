class KitsController < ApplicationController
  before_action :set_kit, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :category, :new, :create, :update_stock]
  def index
    policy_scope(Kit)
    @categories = Category.all
    @user = current_user
    @search = params[:query][:address]
    if @search.present?
      session[:address] = params[:query][:address]
    else
      @search = session[:address]
    end
    if params[:category]
      return @kits = Kit.near(@search, 10, select: "addresses.*, kits.*").joins(restaurant: {stores: :address}).joins(kit_categories: :category).where('categories.name ilike ?', params[:category]).where("kits.stock > ?", 0).order(priority: :desc)
    end
    @kits = Kit.near(@search, 10, select: "addresses.*, kits.*").joins(restaurant: {stores: :address}).order(priority: :desc).where("kits.stock > ?", 0)
    return redirect_to wrong_address_path(query: @search) if @kits.empty?
    @stores = Store.near(@search, 10, select: "addresses.*, stores.*").joins(:restaurant).joins(:address)
  end

  def show
    @kit = Kit.friendly.find(params[:id])
    @kits = @kit.restaurant.kits.where.not(id: @kit.id).where("kits.stock > ?", 0)
    @store = Store.near(session[:address], 10, select: "addresses.*, stores.*").joins(:restaurant).joins(:address).where(restaurant: @kit.restaurant).first
    @store = @kit.restaurant.stores.first if @store.nil?
    @order = Order.new
    @order.build_address
    @disable_days = @store.disabled
    @ingredients = Ingredient.joins(kit_ingredients: :kit).where("kits.id = ?", @kit.id)
    @cookwares = Cookware.joins(kit_cookwares: :kit).where("kits.id = ?", @kit.id)
    if @store.polygon == ""
      @coordinates = []
    else
      @coordinates = JSON.parse(@store.polygon)
    end
  end

  def new
    @kit = Kit.new
    @user = current_user
    authorize @kit
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

    if session[:address].present?
      @search = session[:address]
    end

    @categories = Category.where.not("name ilike ?", "%#{@category}%")
    @stores = Store.near(@search, 10, select: "addresses.*, stores.*").joins(restaurant: {kits: {kit_categories: :category}}).joins(:address).uniq
  end

   def destroy
    @kit.destroy
    redirect_to admin_dashboard_path
  end

  private

  def set_kit
    @kit = Kit.friendly.find(params[:id])
    authorize @kit
  end

  def kit_params
    params.require(:kit).permit(:name, :stock, :price, :size, :preparation_time, :image, :description, :restaurant_id)
  end
end
