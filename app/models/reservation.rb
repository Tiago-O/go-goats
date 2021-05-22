class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true

  validate :new_start_date_cant_be_in_past,
    :new_end_date_cant_be_in_past,
    :end_date_cant_be_before_start_date,
    # :new_reservation_start_date_cannot_be_between_reserved_dates,
    # :new_reservation_end_date_cannot_be_between_reserved_dates,
    :dates_dont_overlap

  def new_start_date_cant_be_in_past
    return unless start_date
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def new_end_date_cant_be_in_past
    return unless end_date
    if end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def end_date_cant_be_before_start_date
    return unless start_date
    if start_date > end_date
      errors.add(:end_date, "needs be after the start date")
    end
  end

  def dates_dont_overlap
    return unless start_date && end_date
    sql = "goat_id=:goat_id AND (start_date, end_date) OVERLAPS (:start, :end)"
    if Reservation.where(sql, start: start_date, end: end_date, goat_id: goat_id).any?
      errors.add(:start_date, "is already picked")
      errors.add(:end_date, "is already picked")
    end
  end

  # made redundant by the dates_dont_overlap:

  # def new_reservation_start_date_cannot_be_between_reserved_dates
  #   if Reservation.exists?(goat: goat, start_date: (start_date..end_date))
  #     errors.add(:start_date, "is already picked")
  #   end
  # end

  # def new_reservation_end_date_cannot_be_between_reserved_dates
  #   if Reservation.exists?(goat: goat, end_date: (start_date..end_date))
  #     errors.add(:end_date, "is already picked")
  #   end
  # end
end
