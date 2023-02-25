class FavouritePlacesController < ApplicationController
  def index
    @favourite_places = FavouritePlace.all
  end

  def create
    @favourite = FavouritePlace.new(favourite_params)

    respond_to do |format|
      if @favourite.save
        format.json { render json: { success: @favourite.save } }
      end
    end
  end

  def destroy
    @favourite = FavouritePlace.find_by(favourite_params)
    respond_to do |format|
      if @favourite.destroy
        format.json { render json: { success: @favourite.destroy } }
      end
    end

  end

  private

  def favourite_params
    params.require(:favourite_place).permit(:user_id, :place_id)
  end
end
