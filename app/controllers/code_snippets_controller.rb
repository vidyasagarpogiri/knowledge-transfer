class CodeSnippetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit]
  
  before_filter :user_identification, only: :edit
  
  def index
    @code_snippets = CodeSnippet.all  
  end
  
  def new
    @code = CodeSnippet.new
  end
  
  def create
    #raise params.inspect
    @code= current_user.code_snippets.create(code_params)
    redirect_to @code
  end
  
  def show
    #raise params.inspect
    
    @code =CodeSnippet.find(params[:id])
    @comments = @code.comments
  end
  
  def edit
    #raise params.inspect
    @code = CodeSnippet.find(params[:id])
  end
  def update
   @code = CodeSnippet.find(params[:id])
   @code.update(code_params)
   redirect_to @code
  end
  
  private
  
  def code_params
    params.require(:code_snippet).permit(:title, :content, :tags, :category_id)
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
