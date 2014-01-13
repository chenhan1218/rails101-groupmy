class Group < ActiveRecord::Base
  has_many :posts
  attr_accessible :description, :title
  validates :title, :presence => true
end
