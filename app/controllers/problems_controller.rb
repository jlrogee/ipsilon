class ProblemsController < ApplicationController
  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    @problems = Problem.includes(:create_user)
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.create_pb.new(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      redirect_to problems_path
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path
  end

  def problem_params
    params.require(:problem).permit(:description, :category_id,:state)
  end

  def find_by_id
    @problem = Problem.find(params[:id])
  end

end
