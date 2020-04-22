class AddOpenToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :open, :string
  end
end
