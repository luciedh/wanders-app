class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create

  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end

  def new
    @place = Place.find(params[:place_id])
    
  end

  private

  def comment_params
    params.require(:comment).permit(:rating)
  end
end
