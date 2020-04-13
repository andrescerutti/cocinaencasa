class RemoveProdMpPublicKeyFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :prod_mp_public_key, :string
  end
end
