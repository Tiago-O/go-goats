class Goat < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
end
