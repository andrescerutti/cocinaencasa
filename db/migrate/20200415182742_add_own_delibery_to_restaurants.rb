class AddOwnDeliberyToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :own_delibery, :boolean, default: false
  end
end
