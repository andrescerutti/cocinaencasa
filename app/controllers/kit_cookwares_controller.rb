class KitCookwaresController < ApplicationController

  def index
    @kit = Kit.friendly.find(params[:kit_id])
    @kits = policy_scope(KitCookware).where(kit: @kit)
    @cookware = Cookware.new
    @kit_cookware = KitCookware.new
  end

  def create
  end
end
