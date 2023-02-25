class UserPlacesController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @trip = Trip.find(params[:trip_id])
    @user_places = UserPlace.new
    @user_places.user = current_user
    @user_places.place = @place
    trip_places = @trip.places.order(:poi_id)

    respond_to do |format|
      if @user_places.save
        format.json {
          render json: {
            marker: place_marker(@place, @trip),
            first: trip_places.first == @place,
            last: trip_places.last == @place
          }
        }
      else
        format.json { render json: {} }
      end
    end
  end

  private

  def place_marker(place, trip)
    {
      visited: true,
      lat: place.geo_lat,
      lng: place.geo_long,
      info_window_html: render_to_string(
        partial: "trips/info_window", locals: {
          place: place,
          comment: Comment.new,
          comments: place.comments.order(rating: :desc),
          users: User.all,
          trip: trip
        },
        formats: :html
      )
    }
  end
end
