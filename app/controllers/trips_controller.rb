class TripsController < ApplicationController
  def search_trip
    @categories = Category.all
  end

  def index
    if params[:query].present?
      @queries = params[:query].split(";")
      @searched_trips = Trip.where(category: @queries)
    else
      @searched_trips = Trip.all
    end
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
    # @place = Place.find(params[:id])
    # @comments = Comment.where(place_id: params[:id]).order(rating: :desc)
    # @users = User.all
    # @comment = Comment.new
  end

end
