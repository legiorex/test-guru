class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question


  SUCCESS = 85
  SUCCESS.freeze

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def current_index
    test.questions.index(self.current_question) + 1
  end

  def result_percent
    correct_questions * 100 / test.questions.size
  end

  def success?
    result_percent >= SUCCESS
  end

  private

  def before_validation_set_first_question
    puts test.questions.first.id

    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
