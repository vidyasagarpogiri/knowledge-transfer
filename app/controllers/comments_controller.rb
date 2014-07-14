class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
    
    def new
      @comment = Comment.new
    end
    
    def create
      @comment = Comment.new(comment_params)
      @comment.save
      redirect_to @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
    end
  
  
    private
      def comment_params
        params.permit(:content, :commentable_id, :commentable_type)
      end
      
      def load_commentable
        resource, id = request.path.split('/')[1,2]
        @commentable = resource.singularize.classify.constantize.find(id)
      end

end
