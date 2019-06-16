class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question

  def show
    render plain: @question.body    
  end

  def index
    render plain: @test.questions.inspect   
  end

  def new
  end

  def create
    question = Question.new
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    binding.pry
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_not_found
    
  end
end
