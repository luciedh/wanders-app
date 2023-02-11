class TripsController < ApplicationController
  def search_trip
    @categories = Category.all
  end

  def index
    @trips = Trip.all
    @queries = params[:query].split(";")
  end

  def show
    trip = Trip.find(params[:id])
    places_of_trip = trip.places.order(:poi_id)
    @markers = places_of_trip.map do |place|
      {
        lat: place.geo_lat,
        lng: place.geo_long,
        info_window_html: render_to_string(partial: "info_window", locals: {place: place})
      }
    end
  end
end
