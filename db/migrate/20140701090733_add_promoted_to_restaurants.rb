class AddPromotedToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :promoted, :boolean
  end
end
