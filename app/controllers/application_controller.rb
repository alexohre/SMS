class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_no, :address, :date_of_birth, :state, :zip_code])
  end


  private

  def after_sign_up_path_for(resource)
    new_user_session_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  

  # def after_sign_in_path_for(resource)
  #   if resource.is_a?(AdminUser)
  #     admin_dashboard_path
  #   else
  #     root_path
  #   end
  # end
end
