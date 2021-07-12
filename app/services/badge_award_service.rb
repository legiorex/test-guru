class BadgeAwardService
  def initialize(current_test_passage)
    @current_test_passage = current_test_passage
    @user = @current_test_passage.user
  end

  def call
    Badge.all.each do |badge|
      puts badge
      @user.badges << badge if send("#{badge.type_badge}_ward?", badge.rule)
    end
  end

  private

  def start_ward?
    TestPassage.where(test_id: @current_test_passage.test_id, user_id: current_user.id).size == 1
  end

  def category_ward?(rule)
    selected_tests = Test.by_category(rule)

    success_tests = TestPassage.where(success: true, user_id: current_user.id)

    result = selected_tests.map do |test|
      success_tests.select { |item| item.test_id == test.id }
    end
    selected_tests.size == result.size
  end
end
