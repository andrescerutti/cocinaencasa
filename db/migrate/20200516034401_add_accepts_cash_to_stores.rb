class AddAcceptsCashToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :accepts_cash, :boolean, default: false
  end
end
