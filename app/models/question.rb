class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  scope :questions_test, ->(test_id) { where(test_id: test_id) }

  validates :body, presence: true
end
