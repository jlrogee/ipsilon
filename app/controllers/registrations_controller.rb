class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :role, :phone, :email, :password, :password_confirmation, :agree)
  end

  def account_update_params
    if current_user.role.admin? || current_user.role.dispatcher?
      params.require(:user).permit(:firstname, :lastname, :role, :phone, :email, :password, :password_confirmation,
                                 :current_password, :uploads)
    else
      params.require(:user).permit(:firstname, :lastname, :phone, :email, :password, :password_confirmation,
                                   :current_password, :uploads)
    end
  end
end