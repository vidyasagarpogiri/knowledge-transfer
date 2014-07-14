class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blogs_params)
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
     params.require(:blog).permit(:title, :content, :tags)
  end
  
end
   
