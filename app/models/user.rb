class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # デバイスの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# バリデーション
validates :name, presence: true
validates :address, length: { maximum: 15 }
validates :profile, length: { maximum: 125 }
validates :name, presence: true
# アソシエーション
  has_many :topics
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_topics, through: :likes, source: 'topic'
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  # 画像の設定
  mount_uploader :image, ImageUploader

end
