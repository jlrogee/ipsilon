class CategoriesController < ApplicationController

  load_and_authorize_resource param_method: :category_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    @categories = Category.all
  end

  def create
    @category = categories.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  private

    def find_by_id
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:catname, :description)
    end
end
