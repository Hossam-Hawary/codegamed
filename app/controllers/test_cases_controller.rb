class TestCasesController < ApplicationController
  def new
    @test_case=TestCase.new
  end

  def index
    @test_cases=TestCase.order("mission_id").all
  end

  def create
    @test_case=TestCase.new(test_cases_params)
    respond_to do |format|
      if @test_case.save
        format.html { redirect_to test_cases_path, notice: 'test case was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  private
  def test_cases_params
    params.require(:test_case).permit(:input,:output,:mission_id)
  end
end
