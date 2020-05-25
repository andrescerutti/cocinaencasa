class AddReadyMadeToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :ready_made, :boolean, default: false
  end
end
