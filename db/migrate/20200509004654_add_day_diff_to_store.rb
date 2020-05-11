class AddDayDiffToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :next_day_hour, :float, default: 0.0
    add_column :stores, :day_for_order, :float, default: 0.0
  end
end
