class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create show destroy]
  before_action :find_question, only: %i[show update destroy]
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @answers = @question.answers
  end

  def new
    binding.pry
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      binding.pry
      redirect_to test_question_path(question)
    else
      render :new
    end
  end

  def edit
    question = @test.questions.update(question_params)

    if question.update
      binding.pry
      redirect_to 
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to tests_path
  end

  def update
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found', status: 404
  end
end
