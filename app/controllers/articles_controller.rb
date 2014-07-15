class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit 
  
  def index
     @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.new(params_articles)
    @article.save
    redirect_to @article
  end
   
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end
  
  def edit
   
   #if @article.find(params[:user_id]) == current_user.id
    @article = Article.find(params[:id])
   #else
   # redirect_to @article
  # end  
     
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(params_articles)
    redirect_to @article
  end
      
  private
  
  def params_articles
    params.require(:article).permit(:title, :content, :tags, :category_id)
  end
  
   def user_identification
   @article = Article.find(params[:id])
    if @article.user_id ==current_user.id
    else
       flash[:notice]= "you are not autherised for this action"
       redirect_to @article
    end 
  end
end
