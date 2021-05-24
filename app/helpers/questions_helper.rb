module QuestionsHelper
  def title_question(question)
    if question.new_record?
      "Напишите новый вопрос для теста #{question.test.title}"
    else
      "Измените вопрос для теста #{question.test.title}"
    end
  end
end
