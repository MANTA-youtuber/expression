class Topic < ApplicationRecord
  # バリデーション
  validates :user_id, presence: true
  validates :description, presence: true
  # validates :image, presence: true

  # アソシエーション
  belongs_to :user
# carrierwaveの設定
  mount_uploader :image, ImageUploader
end
