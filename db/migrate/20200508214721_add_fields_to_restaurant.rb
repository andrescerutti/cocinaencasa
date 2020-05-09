class AddFieldsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :emoji, :string
    add_column :restaurants, :hq_address, :string
  end
end
