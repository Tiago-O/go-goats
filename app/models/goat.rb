class Goat < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
