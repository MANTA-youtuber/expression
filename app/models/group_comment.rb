class GroupComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group_topic, optional: true

  validates :content, presence: true
  validates :user_id, presence: true
  validates :group_topic_id, presence: true
end
