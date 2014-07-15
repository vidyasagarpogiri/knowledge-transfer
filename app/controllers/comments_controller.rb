class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
    
    def new
      @comment = Comment.new
    end
    
    def create
      @comment = current_user.comments.new(comment_params)
      @comment.save
      redirect_to @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
    end
  
  
    private
      def comment_params
        params.permit(:content, :commentable_id, :commentable_type)
      end
      
     

end
