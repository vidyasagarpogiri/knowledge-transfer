class CodeSnippet < ActiveRecord::Base
  include Bootsy::Container
  has_many :comments, as: :commentable
end
