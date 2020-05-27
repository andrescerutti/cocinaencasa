class IngredientsController < ApplicationController
  before_action :set_destroy_ingredient, only: [:destroy]

  def show
  end

  def new
  end

  def create
    @kits = policy_scope(KitIngredient).where(kit: @kit)
    @kit = Kit.friendly.find(params[:kit_id])
    @ingredient = Ingredient.new(ingredient_params)
    @kit_ingredient = KitIngredient.new(kit_ingredient_params)
    @ingredient.save
    @kit_ingredient.kit = @kit
    @kit_ingredient.ingredient = @ingredient
    authorize @ingredient
    return redirect_to kit_kit_ingredients_path(@kit) if @kit_ingredient.save

    render "kit_ingredients/index"
  end

  def edit
  end

  def update
    return redirect_to @kit if @ingredient.update(set_ingredient) || @kit_ingredient.update(kit_ingredient_params)
  end

  def destroy
    @ingredient.kit_ingredients.destroy
    @ingredient.destroy
    redirect_to '/admin_dashboard'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
    authorize @ingredient
  end

  def set_destroy_ingredient
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def set_kit_ingredients
    @kit_ingredients = KitIngredient.find(params[:kit_ingredient_id])
    authorize @kit_ingredients
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :image)
  end

  def kit_ingredient_params
    # params.require(:ingredient).require(:kit_ingredient).permit(:quantity, :unit)
  end
end
