class KitIngredientsController < ApplicationController
  before_action :set_kit_ingredients, only: [:edit, :update]

  def index
    @kit = Kit.find(params[:kit_id])
    @kits = policy_scope(KitIngredient).where(kit: @kit)
    @ingredient = Ingredient.new
    @kit_ingredient = KitIngredient.new
  end

  def new
  end

  def create
    @kit_ingredient = KitIngredient.new(kit_ingredient_params)
    redirect_to  if @kit_ingredient.save
  end

  def edit
  end

  def update
  end

  private

  def set_kit_ingredients
    @kit_ingredient = KitIngredient.find(params[:id])
    authorize @kit_ingredients
  end

  def kit_ingredient_params
    params.require(:kit_ingredients).permit(:quantity, :unit)
  end

  def ingredient_params
    params.require(:ingredients).permit(:image, :name)
  end
end
