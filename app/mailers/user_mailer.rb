class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def comments(user, comment, title, comment_user)
  	@email = user.email
  	@content = comment
  	@title = title
  	@comment_user = comment_user
  	mail(:to => @email, :subject => "User Commented on your post")
  end
  
  def answers(answer)
    @question_title = answer.question.title
    @answer_content = answer.content
    @reciver = answer.question.user.name
    @answer_by = answer.user.name
    @email= answer.question.user.email
    mail(:to => @email, :subject => "User Answered Your Question")
  end
  
end
