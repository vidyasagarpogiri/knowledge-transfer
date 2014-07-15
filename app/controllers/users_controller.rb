class UsersController < ApplicationController
  before_action :find_user, only: [:user_articles, :user_blogs, :user_code_snippets, :user_questions]
  
  def user_articles
    @user_related_articles = @user.articles
  end
  
  def user_blogs
     @user_related_blogs = @user.blogs
  end
  
  def user_code_snippets
     @user_related_code_snippets = @user.code_snippets
  end
  
  def user_questions
     @user_related_questions = @user.questions
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
end
