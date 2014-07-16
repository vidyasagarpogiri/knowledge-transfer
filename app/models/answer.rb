class Answer < ActiveRecord::Base
   include Bootsy::Container
   has_many :comments, as: :commentable
   belongs_to :question
   belongs_to :user
end
