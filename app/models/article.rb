class Article < ActiveRecord::Base
<<<<<<< HEAD
  include Bootsy::Container
=======
 has_many :comments, as: :commentable
 belongs_to :category
>>>>>>> e8cce341bcdc3d39cd0576ea5829aae5ec72620b
end
