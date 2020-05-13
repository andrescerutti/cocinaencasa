class AddPolygonToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :polygon, :hash, default: "[]"
  end
end
