class BlogsController < ApplicationController
  layout "home_template", only: [:new, :edit]
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit 
  
  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(4)
  end
  
  def new
  #raise params.inspect
    @blog = Blog.new
  end
  
  def create
    @blog = current_user.blogs.new(blogs_params)
    if @blog.save
      #flash[:success] = "Successfully saved"
      redirect_to @blog
    else
      flash[:error] = "Title and content should not be empty"
      render "new"
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.page(params[:page]).per(4)
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
  
  def tags
    @blogs = Blog.where("tags LIKE ?",  "%#{params[:tag]}%").page(params[:page]).per(5)
    respond_to do |format|
      format.js
    end
  end   
  
  private
  
  
  
  def blogs_params
     params.require(:blog).permit(:title, :content, :tags, :category_id)
  end
  
  def user_identification
   @blog = Blog.find(params[:id])
   if @blog.user_id ==current_user.id
   else
     flash[:notice]= "you are not autherised for this action"
     redirect_to @blog
   end 
  end
  
end
   
