class Project < ActiveRecord::Base
  has_many :articles
  has_many :questions
  has_many :code_snippets
end
