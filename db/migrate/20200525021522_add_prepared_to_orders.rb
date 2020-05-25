class AddPreparedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :prepared, :boolean, default: false
  end
end
