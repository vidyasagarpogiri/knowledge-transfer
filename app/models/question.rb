class Question < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :category
  belongs_to :user
  belongs_to :project
  has_many :answers
  validates :title,  :presence => true
  validates :content, :presence => true
  
  searchable do
    text :tags, :title
  end
  
  after_create :user_points
  
  private
  
  def user_points
  
    self.user.points += 10 if user_id?
    self.user.save!
  end
  
end
