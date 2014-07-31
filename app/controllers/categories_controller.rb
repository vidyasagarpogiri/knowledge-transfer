class CategoriesController < ApplicationController

  layout "home_template", only: [:new, :edit, :create, :show, :index]
  before_action :find_category, only: [:show_articles, :show_blogs, :show_code_snippets, :show_questions]
  
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
    @category_related_articles = @category.articles.order(:id).page(params[:page]).per(5)
  end
  
  def show_blogs
     @category_related_blogs =@category.blogs.order(:id).page(params[:page]).per(5)
  end
  
  def show_code_snippets
     @category_related_code_snippets = @category.code_snippets.order(:id).page(params[:page]).per(5)
  end
  
  def show_questions
     @category_related_questions = @category.questions.order(:id).page(params[:page]).per(5)
  end
     
  private
  
  def params_categories
    params.require(:category).permit(:title)
  end
  
  def find_category
    @category=Category.find(params[:id])
  end 
end
