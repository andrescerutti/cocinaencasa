class AddFlagsToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :flags, :string, default: ""
  end
end
