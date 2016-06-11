class TestCasesController < ApplicationController
  before_action :authenticate_admin!, :only => [:index, :new, :create, :update, :edit, :destroy]

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

  def edit
    @test_case = TestCase.find(params[:id])
    respond_to do |format|
      format.html
    end
  end


  def update
    @test_case = TestCase.find(params[:id])
    respond_to do |format|
      if @test_case.update(test_cases_params)
        format.html { redirect_to test_cases_path, notice: 'test case was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.destroy
    respond_to do |format|
      format.html { redirect_to test_cases_path, notice: 'test case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def test_cases_params
    params.require(:test_case).permit(:input, :output, :mission_id, :return_type)
  end
end
