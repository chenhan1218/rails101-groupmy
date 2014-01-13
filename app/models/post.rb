class Post < ActiveRecord::Base
  belongs_to :group
  attr_accessible :content, :group_id
  validates :content, :presence => true
end
