class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show
    question = Question.find(params[:id])

    render inline: question.body
  end

  def new; end

  def create
    question = @test.questions.new({ body: params[:body] })
    if question.save
      render plain: 'good'
    else
      redirect_to "/tests/#{params[:test_id]}/questions/new"

    end
  end

  def destroy
    Question.delete(params[:id])
    redirect_to "/tests/#{params[:test_id]}/questions"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
