class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :screens

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
 
  def following?(other_user_id)
    relationships.find_by(followed_id: other_user_id)
  end

  def follow!(other_user_id)
    relationships.create!(followed_id: other_user_id)
  end

  def unfollow!(other_user_id)
    relationships.find_by(followed_id: other_user_id).destroy!
  end

  def feed
    Screen.from_users_followed_by(self)
  end
end
