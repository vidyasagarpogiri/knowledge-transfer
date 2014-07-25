class ArticlesController < ApplicationController

  layout "home_template", only: [:new, :edit]
  
  layout "home_template" , only: [:edit , :new]
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit 
  
  after_action :add_points, only: :create
  
  
  def index
     @articles = Article.order('created_at DESC').page(params[:page]).per(4)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.new(params_articles)

    if @article.save      

      redirect_to @article
    else
      flash[:error] = "Title and content should not be empty"
      render "new"
    end
  end
   
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.page(params[:page]).per(4)
    #raise params.inspect
    @comment = Comment.new
  end
  
  def edit     
    @article = Article.find(params[:id])        
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(params_articles)
    redirect_to @article
  end
  
  def tags
    @articles = Article.where("tags LIKE ?",  "%#{params[:tag]}%").page(params[:page]).per(5)
    respond_to do |format|
      format.js
    end
  end
  
 
      
  private
  
   def add_points
    @user = User.find(@article.user_id)
    points = @user.points+10
    @user.update(:points => points)
   end
  
  def params_articles
    params.require(:article).permit(:title, :content, :tags, :category_id, :project_id)
  end
  
  def user_identification
   @article = Article.find(params[:id])
   if @article.user_id ==current_user.id
   else
    flash[:notice]= "you are not authorised for this action"
    redirect_to @article
   end 
  end
end
