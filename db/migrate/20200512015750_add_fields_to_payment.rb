class AddFieldsToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :status, :string
    add_column :payments, :external_id, :string
    add_column :payments, :date_approved, :string
    add_column :payments, :operation_type, :string
    add_column :payments, :payment_method_id, :string
    add_column :payments, :payment_type_id, :string
    add_column :payments, :status_detail, :string
  end
end
