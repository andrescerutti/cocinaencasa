class AddProdMpPublicKeyCiphertextToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :prod_mp_public_key_ciphertext, :text
  end
end
