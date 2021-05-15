class Goat < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
