class CommentsController < ApplicationController
  before_action :set_place, only: :create

  def update
    @comment = Comment.find(params[:id])
    @comment.update(rating_params)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.place = @place
    @comment.user = current_user
    @comment.rating = 0
    @comment.save
    redirect_to place_path(@place)
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def rating_params
    params.require(:comment).permit(:rating)
  end
end
