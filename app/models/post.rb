class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def self.UserPosts(user_id)
    where(user_id: user_id)
  end

  def self.recentPosts
    order(created_at: :desc).limit(20)
  end

end
