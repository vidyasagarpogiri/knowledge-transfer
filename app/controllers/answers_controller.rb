class AnswersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new]
  
  after_action :add_points, only: :create
  
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new

  end
  
  def create
    @answer = current_user.answers.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.save
    @user = current_user.name
    UserMailer.answers(@answer).deliver
    redirect_to @question
  end
  
  private
  
  def add_points
    @user=User.find(@answer.user_id)
    points = @user.points+10
    @user.update(:points=> points)
  end 
  
  def answer_params
    params.require(:answer).permit(:content, :tags, :bootsy_image_gallery_id, :question_id).merge(user_id: current_user.id)
  end
  
end
