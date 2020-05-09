class AddDifficultyToKit < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :difficulty, :string, default: ""
  end
end
