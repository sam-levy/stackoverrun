class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :title, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 5}
  validates :user_id, presence: true
  validates :topic_id, presence: true
end
