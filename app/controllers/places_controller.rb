class PlacesController < ApplicationController
  def index
    @places = Place.all
    @markers = @places.map do |place|
      {
        lat: place.geo_lat,
        lng: place.geo_long
      }
    end
  end

  def show

  end
end
