class UsersController < ApplicationController
  layout "home_template", only: [:edit, :profile]
  
  before_action :find_user, only: [:user_articles, :user_blogs, :user_code_snippets, :user_questions, :edit, :update, :profile]
  
  def user_articles
    @user_related_articles = @user.articles.order(:id).page(params[:page]).per(4)
  end
  
  def user_blogs
     @user_related_blogs = @user.blogs.order(:id).page(params[:page]).per(4)
  end
  
  def user_code_snippets
     @user_related_code_snippets = @user.code_snippets.order(:id).page(params[:page]).per(4)
  end
  
  def user_questions
     @user_related_questions = @user.questions.order(:id).page(params[:page]).per(4)
  end
  
 
  def profile
    
  end
  
  def edit
 
  end
  
  
  def update
    #@user
    @user.update(user_params)
    redirect_to profile_user_path(@user)
  end
  
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :profile_name)
  end
end
