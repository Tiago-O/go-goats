class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
  end

  def show; end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = User.find(params[:user_id])
    @reservation.goat = User.find(params[:goat_id])
    @reservation.goat = @goat

    @reservation.save
    redirect_to @goat
  end

  # is this method necessary ?
  # def edit; end

  def update
    @reservation.update(reservation_params)
    @reservation.user = @user
    redirect_to @user
  end

  def destroy
    @reservation.destroy
    @reservation.user = @user
    redirect_to @user
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :goat_id, :date, :location)
  end
end
