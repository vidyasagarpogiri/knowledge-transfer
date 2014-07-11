class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params_articles)
    @article.save
    redirect_to @article
  end
   
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
  #raise params.inspect
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(params_articles)
    redirect_to @article
  end
     
  private
  
  def params_articles
    params.require(:article).permit(:title, :content, :tags)
  end
  
end
