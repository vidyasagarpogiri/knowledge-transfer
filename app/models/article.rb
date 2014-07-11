class Article < ActiveRecord::Base
 has_many :comments, as: :commentable
 belongs_to :category
end
