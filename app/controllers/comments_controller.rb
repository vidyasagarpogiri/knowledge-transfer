class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
      
    def new
      @comment = Comment.new
    end
    
  def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        @user = @comment.commentable_type.classify.constantize.find(@comment.commentable_id).user
        #flash[:success] = "Commented successfully"
        @comment_user = current_user
        redirect_to @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
        #raise params.inspect
        @title = @comment.commentable_type.classify.constantize.find(@comment.commentable_id).title
        UserMailer.comments(@user, @comment.content , @title, @comment_user).deliver
      else
         flash[:error] = "Please enter some text"
         redirect_to @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
       end
   end
  
  
    private
      def comment_params
        params.permit(:content, :commentable_id, :commentable_type)
      end
end
