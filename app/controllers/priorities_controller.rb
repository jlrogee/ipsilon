class PrioritiesController < ApplicationController

  load_and_authorize_resource param_method: :priority_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    @priorities = Priority.all.paginate(:page => params[:page])
  end

  def create
    @priority = Priority.new(priority_params)
    if @priority.save
      redirect_to priorities_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @priority.update(priority_params)
      redirect_to priorities_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @priority.destroy
    redirect_to priorities_path
  end

  def new
    @priority = Priority.new
  end

  private

    def find_by_id
      @priority = Priority.find(params[:id])
    end

    def priority_params
      params.require(:priority).permit(:prname, :days_to_close)
    end
end
