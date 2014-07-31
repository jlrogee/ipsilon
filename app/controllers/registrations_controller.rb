class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :role, :phone, :email, :password, :password_confirmation, :agree)
  end

  def account_update_params

    params.require(:user).permit(:firstname, :lastname, :role, :phone, :email, :password, :password_confirmation,
                                 :current_password, :uploads)
  end
end