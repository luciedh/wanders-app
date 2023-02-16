class UserPlacesController < ApplicationController
  def create
    @user_places = UserPlace.new
    @user_places.user = current_user
    @user_places.place = Place.find(params[:place_id])
    if @user_places.save
      redirect_to request.referer
    end
  end
end
