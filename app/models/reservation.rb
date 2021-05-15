class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
end
