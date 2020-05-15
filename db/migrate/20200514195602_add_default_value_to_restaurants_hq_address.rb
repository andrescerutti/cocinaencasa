class AddDefaultValueToRestaurantsHqAddress < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :restaurants, :hq_address, :string, default: ""
    end

    def down
      change_column :restaurants, :hq_address, :string, default: nil
    end
  end
end
