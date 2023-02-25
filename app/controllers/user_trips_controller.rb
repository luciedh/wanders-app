class UserTripsController < ApplicationController

  def create
    @user_trip = UserTrip.new
    @user_trip.user = current_user
    @user_trip.trip = Trip.find(params[:trip_id])
    if @user_trip.save
      redirect_to user_trip_path(@user_trip)
    end
  end

  def show
    @user_trip = UserTrip.find(params[:id])
    @user_places = @user_trip.trip.places.select { |place| visited?(place) }
    @favourite_places = FavouritePlace.all
  end

  private

  def visited?(place)
    !place.user_places.where(user_id: current_user).empty?
  end
end
