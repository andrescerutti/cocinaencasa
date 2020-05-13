class AddPolygonToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :polygon, :text, default: "[]"
  end
end
