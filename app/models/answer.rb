class Answer < ActiveRecord::Base
   include Bootsy::Container
   has_many :comments, as: :commentable
   belongs_to :question
   belongs_to :user


   after_create :user_points

private

  def user_points
  
    self.user.points += 10 if user_id?
    self.user.save!
  end
  
  
end
