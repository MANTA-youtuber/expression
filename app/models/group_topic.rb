class GroupTopic < ApplicationRecord
  # アソシエーション
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :group_comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true


  # 画像の設定
  mount_uploader :image, ImageUploader
end
