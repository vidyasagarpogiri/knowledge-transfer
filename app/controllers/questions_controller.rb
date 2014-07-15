class QuestionsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  # before_action is to perform action, before actions in the array
  before_action :find_params, only: [:show, :edit, :update, :destroy, :user_identification]
  
  before_filter :user_identification, only: :edit 
  
  def index
    @questions=Question.all
  end
 
  def new
    @question=Question.new
  end
 
  def create
    @question=current_user.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end
 
  def show
    @user=User.find_by_id(@question.user_id)
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
    params.require(:question).permit(:title, :content, :tags, :bootsy_image_gallery_id, :category_id)
  end
 
  def find_params
    @question=Question.find(params[:id])
  end
   
  def user_identification
    if @question.user_id ==current_user.id
    else
       flash[:notice]= "you are not autherised for this action"
       redirect_to @question
    end 
  end

end
