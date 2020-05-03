class AddCashToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :cash, :boolean, default: false
  end
end
