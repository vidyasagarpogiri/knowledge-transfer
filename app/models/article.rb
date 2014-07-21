class Article < ActiveRecord::Base
  include Bootsy::Container
  has_many :comments, as: :commentable
  belongs_to :category
  belongs_to :user
  validates :title,  :presence => true
  validates :content, :presence => true
  
  searchable do
    text :tags, :title
  end
  
end
