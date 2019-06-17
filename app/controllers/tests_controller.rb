class TestsController < ApplicationController

	def index
		@tests = Test.all

		render plain: @tests.inspect
	end

  def show
    @test = Test.find(params[:id])
    
    render plain: @test.inspect
  end
end
