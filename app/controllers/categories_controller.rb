class CategoriesController < ApplicationController

  load_and_authorize_resource param_method: :category_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    if params[:search]
      @categories = Category.search(params[:search]).paginate(:page => params[:page])
    else
      @categories = Category.all.paginate(:page => params[:page])
    end
  end

  def create
    @category = Category.new(category_params)
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

  searchable do
    text :catname, :description

    time    :created_at
    time    :updated_at

    string  :sort_catname do
      catname.downcase.gsub(/^(an?|the)/, '')
    end
  end

  private

    def find_by_id
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:catname, :description, :search)
    end
end
