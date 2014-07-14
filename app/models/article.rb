class Article < ActiveRecord::Base
  include Bootsy::Container
  has_many :comments, as: :commentable
  belongs_to :category
  belongs_to :user
end
