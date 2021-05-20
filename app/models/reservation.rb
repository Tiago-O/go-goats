class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true

  validate :new_reservation_start_date_cannot_be_between_reserved_dates,
    :new_reservation_end_date_cannot_be_between_reserved_dates,
    :new_start_date_cant_be_in_past,
    :new_end_date_cant_be_in_past,
    :end_date_cant_be_before_start_date

  def new_reservation_start_date_cannot_be_between_reserved_dates
    if Reservation.exists?(goat: goat, start_date: (start_date..end_date))
      errors.add(:start_date, "is already picked")
    end
  end

  def new_reservation_end_date_cannot_be_between_reserved_dates
    if Reservation.exists?(goat: goat, end_date: (start_date..end_date))
      errors.add(:end_date, "is already picked")
    end
  end

  def new_start_date_cant_be_in_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def new_end_date_cant_be_in_past
    if end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def end_date_cant_be_before_start_date
    if start_date > end_date
      errors.add(:end_date, "needs be after the start date")
    end
  end
end
