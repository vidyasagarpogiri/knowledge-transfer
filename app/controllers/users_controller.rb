class UsersController < ApplicationController
  layout "home_template", only: :user_profiles
  
  before_action :find_user, only: [:user_articles, :user_blogs, :user_code_snippets, :user_questions, :user_profiles]
  
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
  
  def user_profiles
 
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
end
