class Goat < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :price, presence: true
  validates :photos, presence: true
  validates :price, numericality: { only_integer: true }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  pg_search_scope :search_by_location,
    against: [:location],
    using: {
    tsearch: { prefix: true }
    }
end
