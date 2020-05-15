class CookwaresController < ApplicationController
  before_action :set_destroy_cookware, only: [:destroy]

 def create
    @kits = policy_scope(KitCookware).where(kit: @kit)
    @kit = Kit.friendly.find(params[:kit_id])
    @cookware = Cookware.new(cookware_params)
    @kit_cookware = KitCookware.new(kit_cookware_params)
    @cookware.save
    @kit_cookware.kit = @kit
    @kit_cookware.cookware = @cookware
    authorize @cookware
    return redirect_to @kit if @kit_cookware.save

    render "kit_cookwares/index"
  end

  def update
    return redirect_to @kit if @cookware.update(set_cookware) || @kit_cookware.update(kit_cookware_params)
  end

  def destroy
    @cookware.kit_cookwares.destroy
    @cookware.destroy
    redirect_to '/admin_dashboard'
  end

  private

  def set_cookware
    @cookware = cookware.find(params[:cookware_id])
    authorize @cookware
  end

  def set_destroy_cookware
    @cookware = Cookware.find(params[:id])
    authorize @cookware
  end

  def set_kit_ingredients
    @kit_ingredients = KitIngredient.find(params[:kit_cookware_id])
    authorize @kit_ingredients
  end

  def cookware_params
    params.require(:cookware).permit(:name, :image)
  end

  def kit_cookware_params
    params.require(:cookware).permit(:kit_cookware)
  end
end
