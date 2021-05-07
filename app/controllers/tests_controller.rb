class TestsController < ApplicationController
  def index
    render json: { tests: Test.all }
  end

  def start
    render plain: 'Start test'
  end

  def show
    render plain: 'Show test'
  end
end
