class FavouritePlacesController < ApplicationController
  def index
    @favourite_places = FavouritePlace.all
  end
end
