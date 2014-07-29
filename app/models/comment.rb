class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  after_create :user_points
  
  private 
  
  def user_points
   count=Comment.select("user_id").where(:commentable_id =>self.commentable_id,:commentable_type=>self.commentable_type).count
   if count==1
    self.user.points += 5 if user_id?
    self.user.save!
   end
  end
end
