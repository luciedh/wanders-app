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

end
