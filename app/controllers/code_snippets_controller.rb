class CodeSnippetsController < ApplicationController

  layout "home_template", only: [:new, :edit]
  
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit

  
  def index
    @code_snippets = CodeSnippet.order('created_at DESC').page(params[:page]).per(4)
  end
  
  def new
    @code = CodeSnippet.new
  end
  
  def create
    #raise params.inspect
    @code= current_user.code_snippets.create(code_params)
    if @code.save     
      redirect_to @code
    else
      flash[:error] = "Title and content should not be empty"
      render "new"
    end
    
  end
  
  def show
    @code =CodeSnippet.find(params[:id])
    @comments = @code.comments.page(params[:page]).per(4)
  end
  
  def edit
    @code = CodeSnippet.find(params[:id])
  end
  
  def update
   @code = CodeSnippet.find(params[:id])
   if @code.update(code_params)     
     redirect_to @code
     else
      flash[:error] = "Title and content should not be empty"
      redirect_to @code  
    end
  end
  
  def tags 
    @code_snippets = CodeSnippet.where("tags LIKE ?",  "%#{params[:tag]}%").page(params[:page]).per(5)
    respond_to do |format|
      format.js
    end
  end
  
  private
  
 
  
  def code_params
    params.require(:code_snippet).permit(:title, :content, :tags, :category_id, :project_id)
  end
  
  def user_identification
    @code = CodeSnippet.find(params[:id])
    if @code.user_id ==current_user.id
    else
      flash[:notice]= "you are not autherised for this action"
      redirect_to @code
    end 
  end
end
