class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)

    @test.save
    if @test.save

      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    @test.update(test_params)
    if @test.save

      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден!'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
