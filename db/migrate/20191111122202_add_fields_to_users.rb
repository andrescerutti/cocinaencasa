class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mpcard_id, :string
    add_column :users, :mpcustomer_id, :string
  end
end
