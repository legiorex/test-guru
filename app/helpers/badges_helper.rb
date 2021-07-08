module BadgesHelper
  BADGE_RULES = {
    'backend' => 'Успешное прохождение всех тестов из категории Backend', 'frontend' => 'Успешное прохождение всех тестов из категории Frontend', 'start' => 'Успешное прохождение теста с первой попытке', 'hard' => 'Успешное прохождение теста Сложного Уровня'
  }.freeze

  def badge_rule(badge)
    BADGE_RULES[badge.rule]
  end

  def rules
    BADGE_RULES
  end
end
