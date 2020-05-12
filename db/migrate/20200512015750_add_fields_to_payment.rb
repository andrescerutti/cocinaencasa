class AddFieldsToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payment, :approved, :boolean, default: false
    add_column :payment, :status, :string
    add_column :payment, :external_id, :string
    add_column :payment, :date_approved, :string
    add_column :payment, :operation_type, :string
    add_column :payment, :payment_method_id, :string
    add_column :payment, :payment_type_id, :string
    add_column :payment, :status_detail, :string
  end
end
