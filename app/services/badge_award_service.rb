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
    TestPassage.where(test_id: @current_test_passage.test_id).size == 1
  end

  def category_ward?(rule)
    category_id = Category.find_by(title: rule)[0].id

    selected_tests = Test.where(category_id: category_id)

    success_tests = TestPassage.where(success: true)

    result = selected_tests.map do |test|
      success_tests.select { |item| item.test_id == test.id }
    end
    selected_tests.seze == result.size
  end
end
