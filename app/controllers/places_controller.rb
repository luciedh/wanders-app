class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
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
    @place = Place.find(params[:id])
    @comments = Comment.where(place_id: params[:id]).order(rating: :desc)
    @users = User.all
    @comment = Comment.new
  end
end
