class Group < ActiveRecord::Base
  has_many :posts
  has_many :group_user
  has_many :members, :through => :group_users, :source => :group
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  validates :title, :presence => true

  after_create :join_owner_to_group

  def editable_by?(user)
    user && user == owner
  end

  def join_owner_to_group
    member << owner
  end
end
