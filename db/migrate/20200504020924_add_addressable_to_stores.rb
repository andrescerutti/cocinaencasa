class AddAddressableToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :addressable, polymorphic: true
  end
end
