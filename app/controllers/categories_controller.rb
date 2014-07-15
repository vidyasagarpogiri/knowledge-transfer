class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params_categories)
    @category.save
    redirect_to @category
  end
   
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update(params_categories)
    redirect_to @category
  end
  
  def show_articles
    @category = Category.find(params[:id])
    @category_related_articles = @category.articles
  end
  
  def show_blogs
     @category_related_blogs = Category.find(params[:id]).blogs
  end
  
  def show_code_snippets
     @category_related_code_snippets = Category.find(params[:id]).code_snippets
  end
  
  def show_questions
     @category_related_questions = Category.find(params[:id]).questions
  end
     
  private
  
  def params_categories
    params.require(:category).permit(:title)
  end
  
end
