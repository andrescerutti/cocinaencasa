class AddDayOpenToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :day_open, :string
  end
end
