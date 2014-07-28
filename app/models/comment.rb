class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  
  after_create :user_points
  
  private 
  
  def user_points
    commentable.comments.map(&:user_id).include?(user_id)
  end
  
end
