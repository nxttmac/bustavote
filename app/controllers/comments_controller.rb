class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {       
          flash[:success] = "Comment added!"
          redirect_to root_url 
        }
        format.js
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :question_id, :user_id )
    end
end