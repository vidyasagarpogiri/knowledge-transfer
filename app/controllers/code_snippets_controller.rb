class CodeSnippetsController < ApplicationController

  def index
    @code_all = CodeSnippet.all  
  end
  
  def new
    @code = CodeSnippet.new
  end
  
  def create
    @code= CodeSnippet.create(code_params)
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
    params.require(:code_snippet).permit(:title, :content, :tags)
  end
  
end
