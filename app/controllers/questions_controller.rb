class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create show destroy]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    render plain: @question.inspect
  end

  def index
    render plain: @test.questions.inspect
  end

  def new; end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: question.inspect
    else
      render 'questions/show', alert: "Coudn't save"
    end
  end

  def destroy
    @question.destroy

    render plain: "Question deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found', status: 404
  end
end
