class Question < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :category
  belongs_to :user
end
