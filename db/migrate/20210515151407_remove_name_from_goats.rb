class RemoveNameFromGoats < ActiveRecord::Migration[6.0]
  def change
    remove_column :goats, :name, :string
  end
end
