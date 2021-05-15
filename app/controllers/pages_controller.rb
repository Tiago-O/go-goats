class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @goats = Goat.all

    @markers = @goats.geocoded.map do |goat|
      {
        lat: goat.latitude,
        lng: goat.longitude
      }
    end
  end
end
