class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    authorize(@answer)
    @answer.user = current_user
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
