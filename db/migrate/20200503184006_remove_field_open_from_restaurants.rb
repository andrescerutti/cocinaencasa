class RemoveFieldOpenFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :open, :string
  end
end
