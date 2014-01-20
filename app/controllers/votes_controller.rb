class VotesController < ApplicationController

  def create
    @vote = current_user.votes.build(vote_params)
    if @vote.save
      respond_to do |format|
        format.html { 
          flash[:success] = "Vote saved!"
          redirect_to root_url 
        }
        format.js
      end
    else
      @feed_items = []
      flash[:error] = "Something went wrong."
      render 'static_pages/home'
    end
  end

  def update
	  @vote = Vote.find(params[:id])
  	if @vote.update_attributes(vote_params)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render 'update' }
      end
    else
      render 'static_pages/home'
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:question_id, :choice_id, :user_id )
    end

end