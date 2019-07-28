class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :group_topics, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_comments, dependent: :destroy

  accepts_nested_attributes_for :group_users, allow_destroy: true
  accepts_nested_attributes_for :group_topics, allow_destroy: true


  # バリデーション
  validates :name,  presence: true
  # 画像の設定
  mount_uploader :image, ImageUploader
end
