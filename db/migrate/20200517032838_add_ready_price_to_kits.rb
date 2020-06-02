class AddReadyPriceToKits < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :ready_price, :integer, default: 0
  end
end
