class AssetsController < ApplicationController

  load_and_authorize_resource param_method: :asset_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]

  def index
    if params[:search]
      @assets = Asset.search(params[:search]).paginate(:page => params[:page])
    else
      @assets = Asset.all.paginate(:page => params[:page])
    end
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @asset.update(asset_params)
      redirect_to assets_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @asset.destroy
    redirect_to assets_path
  end

  def new
    @asset = Asset.new
  end

  searchable do
    text :name, :account_number

    integer :type
    integer :user_id
    integer :organization_id
    time    :created_at
    time    :updated_at

    string  :sort_name do
      name.downcase.gsub(/^(an?|the)/, '')
    end
  end

  private

    def find_by_id
      @asset = Asset.find(params[:id])
    end
  
    def asset_params
      params.require(:asset).permit(:name, :type, :organization_id, :account_number, :user_id, :search)
    end
end
