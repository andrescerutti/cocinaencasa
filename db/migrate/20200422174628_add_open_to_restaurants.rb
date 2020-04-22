class AddOpenToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :open, :string
  end
end
