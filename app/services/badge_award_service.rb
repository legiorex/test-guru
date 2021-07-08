class BadgeAwardService
  def initialize(current_test_passage)
    @current_test_passage = current_test_passage
  end

  def call
    if first_passage_test && @current_test_passage.success
      badge = UserBadge.new
      badge.user_id = @current_test_passage.user_id
      badge.badge_id = find_badge('start').id
      badge.save
    end
  end

  def first_passage_test
    TestPassage.where(test_id: @current_test_passage.test_id).size == 1
  end

  private

  def find_badge(rule)
    Badge.where(rule: rule)[0]
  end
end
