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
    @favourite_places = FavouritePlace.all
  end
end
