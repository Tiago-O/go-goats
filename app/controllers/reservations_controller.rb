class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
  end

  def show; end

  def create
    @goat = Goat.find(params[:goat_id])
    @review = Review.new
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.goat = @goat
    # render 'goats/show' unless @reservation.save
    render :new unless @reservation.save
  end

  def edit; end

  def update
    @reservation.update(reservation_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :goat_id, :start_date, :end_date, :location)
  end
end
