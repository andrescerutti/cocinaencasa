class AddOwnDeliveryToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :own_delivery, :boolean, default: false
  end
end
