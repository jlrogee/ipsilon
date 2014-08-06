class SolutionsController < ApplicationController

  load_resource :problem
  load_and_authorize_resource :solution, through: :problem

  def index
  end

  def create
    @solution = @problem.solutions.new(solution_params)
    if @solution.save
      redirect_to edit_problem_path(@problem)
    else
      redirect_to edit_problem_path
    end
  end

  def new
  end

  private
    def find_problem
      @problem = Problem.find(params[:problem_id])
    end

    def solution_params
      params.require(:solution).permit(:description, :problem_id, :create_user_id)
    end
end
