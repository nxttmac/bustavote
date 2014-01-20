class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @question  = current_user.questions.build
      @feed_items = current_user.public_feed.paginate(page: params[:page])
      @vote = Vote.new
      @comment = Comment.new
    end
  end

  def following
    if signed_in?
      @question  = current_user.questions.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @vote = Vote.new
      @comment = Comment.new
      @feed_togle = "following"
      render "home"
    end
  end

  def help
  end

  def about
  end  

  def contact
  end 
end
