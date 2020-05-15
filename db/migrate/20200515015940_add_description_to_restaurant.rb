class AddDescriptionToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :description, :string, default: ""
  end
end
