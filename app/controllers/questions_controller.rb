class QuestionsController < ApplicationController

 layout "home_template", only: [:new, :edit]
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  # before_action is to perform action, before actions in the array
  before_action :find_params, only: [:show, :edit, :update, :destroy, :user_identification]
  
  before_filter :user_identification, only: :edit 
  
  #after_action :add_points, only: :create
  
    def index
      @questions=Question.order('created_at DESC').page(params[:page]).per(4)
    end
 
    def new
      @question=Question.new
    end
 
    def create
      @question = current_user.questions.new(question_params)
      if @question.save
        
        redirect_to @question
      else
        flash[:error] = "Title and content should not be empty"
        render "new"
     end
    end
 
    def show
      @answers = @question.answers
      @answer = Answer.new
      respond_to do |format|
        format.html
        format.js
      end
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
    
    def tags
      @questions = Question.where("tags LIKE ?",  "%#{params[:tag]}%").page(params[:page]).per(5)
      respond_to do |format|
        format.js
      end
    end
 
    private
    
   # def add_points
    #  @user = User.find(@question.user_id)
     # points = @user.points+5
      #@user.update(:points => points)
    # end
 
    def question_params
      params.require(:question).permit(:title, :content, :tags, :bootsy_image_gallery_id, :category_id, :project_id)
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
