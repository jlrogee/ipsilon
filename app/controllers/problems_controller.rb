class ProblemsController < ApplicationController

  load_and_authorize_resource param_method: :problem_params

  before_action :find_by_id, only: [:show, :update, :edit]

  def index
    if can? :create, current_user
      @problems = Problem.includes(:create_user).paginate(:page => params[:page])
    else
      @problems = Problem.where("create_user_id = ? OR performer_user_id = ?", current_user.id, current_user.id).paginate(:page => params[:page])
    end
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


  private

    def problem_params
      params.require(:problem).permit(:description, :category_id, :state, :priority_id)
    end

    def find_by_id
      @problem = Problem.find(params[:id])
    end

end
