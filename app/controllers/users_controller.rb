class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:users_index, :user_articles, :user_blogs, :user_code_snippets, :user_questions, :edit, :update, :profile]
  
  layout "profile_template", only: [:edit, :profile, :index]
  
  before_action :find_user, only: [:user_articles, :user_blogs, :user_code_snippets, :user_questions, :edit, :update, :profile, :new, :subscribe]
  
  def index
    @users = User.all
  end
  
  def user_articles
    @user_related_articles = @user.articles.order(:id).page(params[:page]).per(5)
    
  end
  
  def user_blogs
     @user_related_blogs = @user.blogs.order(:id).page(params[:page]).per(5)
  end
  
  def user_code_snippets
     @user_related_code_snippets = @user.code_snippets.order(:id).page(params[:page]).per(5)
  end
  
  def user_questions
     @user_related_questions = @user.questions.order(:id).page(params[:page]).per(5)
  end
  
 
  def profile
    @user_questions = @user.questions.limit(5)
    
    @user_code_snippets = @user.code_snippets.limit(5)
    
    @user_blogs = @user.blogs.limit(5)
    
    @user_articles = @user.articles.limit(5)
    
  end
  
  def edit

  end
  
  
  def update
    #@user
    if @user.id == current_user.id
      @user.update(user_params)
      redirect_to profile_user_path(@user)
     else
     redirect_to profile_user_path(@user)
     end
  end
  
  def subscribe
    Subscription.create(:email => @user.email)
    
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
