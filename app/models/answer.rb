class Answer < ApplicationRecord
  belongs_to :question
  scope :is_correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :max_answers

  private

  def max_answers
    errors.add(:base) if Answer.where('question_id' => question_id).length >= 4
  end
end
