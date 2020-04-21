class IngredientsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @kits = policy_scope(KitIngredient).where(kit: @kit)
    @kit = Kit.find(params[:kit_id])
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    @ingredient.kit_ingredients.build
    return redirect_to @kit if @ingredient.save

    @kit = Kit.find(params[:kit_id])
    authorize @ingredient
    render "kit_ingredients/index"
  end

  def edit
  end

  def update
    return redirect_to @kit if @ingredient.update(step_params)
  end

  def destroy
  end

  private

  def set_kit_ingredients
    @kit_ingredients = KitIngredient.find(params[:kit_ingredient_id])
    authorize @kit_ingredients
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :image, kit_ingredients_attributes: [:quantity, :unit])
  end
end
