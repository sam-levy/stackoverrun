class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :content, presence: true, length: {minimum: 5}
  validates :user_id, presence: true
  validates :question_id, presence: true
end
