class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  
  after_action :add_points, only: :create
    
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
        UserMailer.comments(@user, @comment.content , @title, @comment_user, @type).deliver
      else
         flash[:error] = "Please enter some text"
         redirect_to @comment.commentable_type.classify.constantize.find(@comment.commentable_id)
       end
   end
   
   def add_points
    @user=User.find(@comment.user_id)
    points = @user.points+5
    @user.update(:points=> points)
   end
  
  
    private
      def comment_params
        params.permit(:content, :commentable_id, :commentable_type)
      end
end
