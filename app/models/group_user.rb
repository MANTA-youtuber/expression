class GroupUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true

  validates :user, presence: true
  validates :group, presence: true
end
