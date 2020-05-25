class AddDniToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :dni, :string, default: ""
  end
end
