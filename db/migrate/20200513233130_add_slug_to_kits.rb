class AddSlugToKits < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :slug, :string
    add_index :kits, :slug, unique: true
  end
end
