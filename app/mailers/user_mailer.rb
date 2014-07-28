class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def comments(user, comment, title, comment_user, type)
  #raise params.inspect
    @user = user
    @commentable_type = type
  	@email = user.email
  	@content = comment
  	@title = title
  	@comment_user = comment_user
  	mail(:to => @email, :subject => "#{@comment_user.name} Commented on your #{@commentable_type} - #{@title} ")
  end
  
  def answers(answer)
    @question_title = answer.question.title
    @answer_content = answer.content
    @receiver = answer.question.user.name
    @answer_by = answer.user.name
    @email= answer.question.user.email
    mail(:to => @email, :subject => "#{@answer_by} answered your question - #{@question_title}")
  end
  
end
