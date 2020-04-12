class AddFieldsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :city, :string
    add_column :addresses, :flat_number, :string
    add_column :addresses, :state, :string
    add_column :addresses, :cp, :string
  end
end
