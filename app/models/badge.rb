class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  BADGE_RULES = {
    'backend' => 'Успешное прохождение всех тестов из категории Backend', 'frontend' => 'Успешное прохождение всех тестов из категории Frontend', 'start' => 'Успешное прохождение теста с первой попытке', 'hard' => 'Успешное прохождение теста Сложного Уровня'
  }.freeze

  def badge_rule
    BADGE_RULES[rule]
  end
end
