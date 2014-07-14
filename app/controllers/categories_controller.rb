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
     
  private
  
  def params_categories
    params.require(:category).permit(:title)
  end
  
end
