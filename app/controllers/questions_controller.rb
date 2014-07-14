class QuestionsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  # before_action is to perform action, before actions in the array
  before_action :find_params, only: [:show, :edit, :update, :destroy]
 
  def index
    @questions=Question.all
  end
 
  def new
    @question=Question.new
  end
 
  def create
    @question=Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end
 
  def show
  end
 
  def edit
  end
 
  def update
    @question=@question.update(question_params)
    if @question
      redirect_to question_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @question.destroy
    redirect_to questions_path
  end
  
 
  private
 
  def question_params
    params.require(:question).permit(:title, :content, :tags, :bootsy_image_gallery_id)
  end
 
  def find_params
    @question=Question.find(params[:id])
  end

end
