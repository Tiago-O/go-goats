class AddColumnsToGoats < ActiveRecord::Migration[6.0]
  def change
    add_column :goats, :location, :string
    add_column :goats, :number, :integer
    add_column :goats, :description, :string
  end
end
