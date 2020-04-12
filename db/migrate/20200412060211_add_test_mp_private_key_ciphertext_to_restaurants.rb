class AddTestMpPrivateKeyCiphertextToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :test_mp_private_key_ciphertext, :text
  end
end
