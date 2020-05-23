class AddDiscountToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :discount, :float, default: 0.0
  end
end
