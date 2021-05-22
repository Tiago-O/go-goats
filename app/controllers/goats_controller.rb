class GoatsController < ApplicationController
  before_action :set_goat, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @goats = Goat.search_by_location(params[:query])
    elsif params[:coords].present?
      coords = params[:coords].split(',')
      @goats = Goat.near([coords[0], coords[1]], 50, units: :km)
    else
      @goats = Goat.all
    end

    @markers = @goats.geocoded.map do |goat|
      {
        lat: goat.latitude,
        lng: goat.longitude
      }
    end
  end

  def show
    @reservation = Reservation.new
    @review = Review.new
    @reviews = @goat.reviews.order(created_at: :desc).page(params[:page])
  end

  def new
    @goat = Goat.new
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user
    if @goat.save
      redirect_to @goat
    else
      render :new
    end
  end

  def edit; end

  def update
    @goat.update(goat_params)
    redirect_to @goat
  end

  def destroy
    @goat.destroy
    redirect_to goats_path
  end

  private

  def set_goat
    @goat = Goat.find(params[:id])
  end

  def goat_params
    params.require(:goat).permit(:price, :user_id, :number, :location, :description, photos: [])
  end
end
