class Review < ApplicationRecord
  belongs_to :user
  belongs_to :goat
  paginates_per 3

  validates :comment, presence: true, length: { in: 5..300 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end
