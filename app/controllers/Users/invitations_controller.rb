class Users::InvitationsController < Devise::InvitationsController
  layout "auth"
  before_action :update_sanitized_params, only: :update

  
  protected

  def after_accept_path_for(resource)
    admin_dashboard_path(notice: "Welcome #{current_user.first_name}, you signed in successfully...")
  end
  
  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :password_confirmation, :invitation_token, :address, :first_name, :last_name, :state, :phone_no, :zip_code, :gender, :date_of_birth])
  end

end
