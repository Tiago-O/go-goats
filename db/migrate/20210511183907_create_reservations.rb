class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :location
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :goat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
