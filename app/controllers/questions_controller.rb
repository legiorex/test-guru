class QuestionsController < ApplicationController
  # before_action :find_test

  def create
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def index
    @questions = Question.questions_test(params[:test_id])

    render inline: '<% @questions.each  { |item| %> <p> <%=item.body %> </p> <% }  %>'
  end

  def show
    question = Question.find(params[:id])

    render inline: question.body
  end

  def new; end

  def redirect
    # render plain: 'test'
    # render inline: params
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  # def find_test
  #   @test = Test.find(params[:test_id])
  # end
end
