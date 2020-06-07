class AddDeliveryTimeToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :delivery_time, :string, default: ""
  end
end
