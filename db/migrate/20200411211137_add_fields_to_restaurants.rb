class AddFieldsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :email, :string
    add_column :restaurants, :phone, :string
    add_column :restaurants, :test_mp_public_key, :string
    add_column :restaurants, :test_mp_private_key, :string
    add_column :restaurants, :prod_mp_public_key, :string
    add_column :restaurants, :prod_mp_private_key, :string
  end
end
