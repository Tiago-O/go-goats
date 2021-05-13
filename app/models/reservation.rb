class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :date, presence: true
  validates :location, presence: true
end
