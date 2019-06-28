class Topic < ApplicationRecord

  # バリデーション
  validates :user_id, presence: true
  validates :description, presence: true
  # validates :image, presence: true

  # アソシエーション

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: 'user'


# carrierwaveの設定
  mount_uploader :image, ImageUploader


end
