class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit 
  
  def index
    @blogs = Blog.all
  end
  
  def new
  #raise params.inspect
    @blog = Blog.new
  end
  
  def create
    #raise params.inspect
    @blog = current_user.blogs.new(blogs_params)
    @blog.save
    redirect_to @blog
  end
  
  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments
    @comment = Comment.new
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    redirect_to @blog
  end
     
  
  private
  
  def blogs_params
     params.require(:blog).permit(:title, :content, :tags, :category_id)
  end
  
  def user_identification
   @blog = Blog.find(params[:id])
    if @blog.user_id ==current_user.id
      true
    else
       flash[:notice]= "you are not autherised for this action"
       redirect_to @blog
    end 
  end
  
end
   
