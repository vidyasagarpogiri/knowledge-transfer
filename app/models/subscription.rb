class Subscription < ActiveRecord::Base
  validates :email, uniqueness: true
end
