class Blog < ActiveRecord::Base

   has_many :comments, as: :commentable

  include Bootsy::Container

end
