class RemoveOpeningFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :opening, :string
  end
end
