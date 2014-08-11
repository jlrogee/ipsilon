class UsersController < ApplicationController
  load_and_authorize_resource param_method: :user_params
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    #redirect_to users_path if @user != current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :firstname, :lastname, :phone, :role,:departament)
    end
end
