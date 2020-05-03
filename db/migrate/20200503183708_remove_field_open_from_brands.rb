class RemoveFieldOpenFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :open, :string
  end
end
