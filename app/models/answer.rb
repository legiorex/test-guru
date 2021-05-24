class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :max_answers, on: :create

  private

  def max_answers
    errors.add(:base, 'there can be no more than 4 questions') if question.answers.size >= 4
  end
end
