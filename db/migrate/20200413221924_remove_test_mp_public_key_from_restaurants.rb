class RemoveTestMpPublicKeyFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :test_mp_public_key, :string
  end
end
