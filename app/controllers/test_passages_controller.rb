class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[result update show gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? do
         if @test_passage.success?
           @test_passage.success = true
           badge = BadgeAwardService.new(@test_passage)
           badge.call
         end
       end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    created_gist = result.call

    flash_options = if result.success?
                      { alert: t('.failure') }
                    else
                      current_user.gists.create(gist_url: created_gist[:html_url],
                                                question: @test_passage.current_question)

                      { notice: view_context.link_to(t('.success'), created_gist[:html_url]) }

                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
