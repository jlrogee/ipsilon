class ProblemsController < ApplicationController

  load_and_authorize_resource param_method: :problem_params

  before_action :find_by_id, only: [:show, :update]

  def index
    if can? :create, current_user
      @problems = Problem.includes(:create_user, :category, :solutions, :priority).paginate(:page => params[:page])
    else
      @problems = Problem.where("create_user_id = ? OR performer_user_id = ?", current_user.id, current_user.id).paginate(:page => params[:page])
    end
  end

  def show
  end

  def new
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
    find_by_id.solutions.build
  end

  def update
    @problem.last_update_user = current_user
    if @problem.update(problem_params)
      redirect_to problems_path
    else
      render :edit
    end
  end


  private

    def problem_params
      if current_user.role.admin? || current_user.role.dispatcher?
        params.require(:problem).permit(:description, :category_id, :state, :priority_id, :performer_user_id, :last_update_user_id,
                                        :create_user_id, :last_update_user_id, :state_event,
                                        solutions_attributes: solution_params)
      else
        params.require(:problem).permit(:description, :category_id, :state, :create_user_id, :last_update_user_id,
                                        :last_update_user_id, solutions_attributes: solution_params)
      end

    end

    def solution_params
      [:description, :problem_id, :create_user_id, :id]
    end

    def find_by_id
      @problem = Problem.find(params[:id])
    end

end
