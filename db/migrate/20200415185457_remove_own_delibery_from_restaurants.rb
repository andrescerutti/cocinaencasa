class RemoveOwnDeliberyFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :own_delibery, :boolean
  end
end
