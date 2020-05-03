class AddPaidDeliveryToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paid_delivery, :boolean, default: false
  end
end
