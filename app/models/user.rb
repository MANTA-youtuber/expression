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
  # 画像の設定
  mount_uploader :image, ImageUploader

end
