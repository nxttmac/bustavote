class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question asked!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_url
  end

  def ask
    @question = Question.new
    2.times { @question.choices.build }
  end

  private

    def question_params
      params.require(:question).permit(:content, choices_attributes: [:content] )
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end
end