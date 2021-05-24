module TestsHelper
  TEST_LEVELS = { 0 => 'начальный', 1 => 'средний', 2 => 'сложный' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'продвинутый'
  end
end
