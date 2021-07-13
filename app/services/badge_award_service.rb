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

  def category_ward?(category)
    selected_tests = Test.by_category(category)

    user_tests = @user.tests.tests_by_category(category).uniq.count

    selected_tests.count == user_tests.count
  end
end
