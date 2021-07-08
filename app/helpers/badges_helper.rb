module BadgesHelper
  BADGE_RULES = {
    0 => 'Успешное прохождение всех тестов из категории Backend', 1 => 'Успешное прохождение всех тестов из категории Frontend', 2 => 'Успешное прохождение теста с первой попытке', 3 => 'Успешное прохождение теста Сложного Уровня'
  }.freeze
  def badge_rule(badge)
    BADGE_RULES[badge.rule]
  end

  def rules
    BADGE_RULES
  end
end
