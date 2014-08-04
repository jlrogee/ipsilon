class DepartamentsController < ApplicationController

  load_and_authorize_resource param_method: :departament_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    if params[:search]
      @departaments = Departament.search(params[:search])
    else
      @departaments = Departament.all
    end
    @departaments = @departaments.paginate(:page => params[:page])
  end

  def create
    @departament = Departament.new(departament_params)
    if @departament.save
      redirect_to departaments_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @departament.update(departament_params)
      redirect_to departaments_path
    else
      render :edit
    end
  end

  def destroy
    @departament.destroy
    redirect_to departaments_path
  end

  def new
    @departament = Departament.new
  end

  private

  def find_by_id
    @departament = Departament.find(params[:id])
  end

  def departament_params
    params.require(:departament).permit(:depname, :organization_id, :search, :adress, :phone, :city, :zipcode, :country)
  end
end
