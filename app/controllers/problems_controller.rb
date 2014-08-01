class ProblemsController < ApplicationController
  def index
    @problems = Problem.includes(:create_user)
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.create_pb.new(params.require(:problem).permit(:description))
    if @problem.save
      redirect_to problems_path
    else
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(params.require(:problem).permit(:description))
      redirect_to problems_path
    else
      render :edit
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to problems_path
  end

end
