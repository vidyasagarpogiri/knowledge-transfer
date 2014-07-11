class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
  raise params.inspect  
  end
   private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
