class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def custom
    @comment = Comment.new
  end
  def new
  end
end
