class AddTagsToKit < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :tags, :string, default: ""
  end
end
