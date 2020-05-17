class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_question, only: [:show, :destroy]

  def index
    @questions = policy_scope(Question).all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
    authorize(@question)
    @topics = Topic.all
  end

  def create
    @question = Question.new(question_params)
    authorize(@question)
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
    authorize(@question)
  end

  def question_params
    params.require(:question).permit(:title, :content, :topic_id)
  end
end
