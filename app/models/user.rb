class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # デバイスの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# バリデーション
validates :name, presence: true
# アソシエーション
  has_many :topics
  has_many :comments
end
