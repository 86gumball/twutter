class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :friendships
  has_many :friends, through: :friendships

  def username
    self.email.split('@').first
  end

  def is_friend_with?(friend_id)
    Friendship.exists?(user_id: id, friend_id: friend_id)
  end
end
