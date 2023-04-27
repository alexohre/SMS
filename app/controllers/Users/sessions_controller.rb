# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :log_activity, only: [:create, :destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   log_activity("signed in") if signed_in?
  # end

  # DELETE /resource/sign_out
  def destroy
    log_activity("signed out") if signed_in?
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def log_activity(action = action_name)
     if action_name == "create"
      UserActivityLog.create(user_id: current_user.id, action: "#{request.path}##{action_name}", description: "User signed in at #{Time.now}") if user_signed_in?
    elsif action_name == "destroy"
      UserActivityLog.create(user_id: current_user.id, action: "#{request.path}##{action_name}", description: "User signed out at #{Time.now}") if user_signed_in?
    end
  end

  # def log_activity
  #   if action_name == "create"
  #     UserActivityLog.create(user_id: current_user.id, action: "#{request.path}##{action_name}", description: "User signed in at #{Time.now}") if user_signed_in?
  #   elsif action_name == "destroy"
  #     UserActivityLog.create(user_id: current_user.id, action: "#{request.path}##{action_name}", description: "User signed out at #{Time.now}") if user_signed_in?
  #   end
  # end

end
