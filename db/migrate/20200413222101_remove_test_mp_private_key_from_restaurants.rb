class RemoveTestMpPrivateKeyFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :test_mp_private_key, :string
  end
end
