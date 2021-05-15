class AddPriceToGoats < ActiveRecord::Migration[6.0]
  def change
    add_column :goats, :price, :integer
  end
end
