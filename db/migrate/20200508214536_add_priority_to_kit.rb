class AddPriorityToKit < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :priority, :integer, default: 0
  end
end
