class AssetsController < ApplicationController
  include ApplicationHelper
  load_and_authorize_resource param_method: :asset_params

  before_action :find_by_id, only: [:destroy, :show, :update, :edit]
  
  def index
    if params[:search]
      @assets = Asset.search(params[:search])
    else
      @assets = Asset.all
    end
    @assets = @assets.paginate(:page => params[:page])
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def show
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

  def destroy

    @asset.destroy
    redirect to assets_path

  end

    private

     def find_by_id
       @asset = Assets.find(params[:id])
     end

     def asset_params
       params.require(:asset).permit(:name, :type, :organization, :account_number, :user, :search)
     end

end
