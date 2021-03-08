class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :fullname, presence: true, length: { maximum: 100 }
  validates :photo, presence: true
  validates :coverimage, presence: true
  has_many :opinions, foreign_key: 'author_id'
  has_many :followers, foreign_key: :followed_id, class_name: 'Following'
  has_many :user_followers, through: :followers, source: :follower

  has_many :followeds, foreign_key: :follower_id, class_name: 'Following'
  has_many :user_followeds, through: :followeds, source: :followed

  def follow_user(user_id)
    @follow = Following.create(follower_id: id, followed_id: user_id)
    @user = User.find(user_id)
    @user.count_followed += 1
    self.count_follower += 1
    @user.save
    save
  end
end
