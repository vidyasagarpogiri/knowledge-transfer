class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  

    
    def index
      @comments = Comment.order('created_at DESC').page(params[:page]).per(4)
      respond_to do |format|
       format.js
      end
    end 
   
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
        @type = @comment.commentable_type
        #raise params.inspect
        #delay job applied to sens user mail insted of deliver delay is used
        UserMailer.delay.comments(@user, @comment.content , @title, @comment_user, @type)
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
