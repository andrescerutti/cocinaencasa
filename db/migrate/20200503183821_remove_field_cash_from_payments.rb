class RemoveFieldCashFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :cash, :string
  end
end
