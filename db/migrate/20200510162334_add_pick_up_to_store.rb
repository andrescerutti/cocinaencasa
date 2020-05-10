class AddPickUpToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :pick_up, :boolean, default: false
  end
end
