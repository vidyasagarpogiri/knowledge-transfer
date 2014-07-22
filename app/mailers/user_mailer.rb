class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def comments(user, comment, title, comment_user)
  	@email = user.email
  	@content = comment
  	@title = title
  	@comment_user = comment_user
  	mail(:to => @email, :subject => "User Commented on your post")
  end
  
  def answers(user, answer)
    @user=user
  	@email = @user.email
  	@answer_user = answer
  	  	#raise params.inspect
  	mail(:to => @email, :subject => "User answered to your question", )
  end
  
end
