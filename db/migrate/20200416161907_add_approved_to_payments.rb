class AddApprovedToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :approved, :boolean, default: false
  end
end
