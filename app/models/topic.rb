class Topic < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: {minimum: 2}

  has_many :questions
end
