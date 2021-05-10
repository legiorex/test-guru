module QuestionsHelper
  def title_question(test, question = nil)
    if question
      "Измените вопрос для теста #{test.title}"
    else
      "Напишите новый вопрос для теста #{test.title}"
    end
  end
end
