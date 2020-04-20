class AddOpeningToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :opening, :string
  end
end
