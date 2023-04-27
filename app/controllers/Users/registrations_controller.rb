# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_layout
  after_action :log_user_activity

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do |resource|
      log_user_activity("created account")
    end
  end

  # GET /resource/edit
  # def edit
  #   super do |resource|
  #     log_user_activity("updated profile")
  #   end
  # end

  # PUT /resource
  def update
    super do |resource|
      updated_attributes = resource.previous_changes.transform_values(&:last)
      log_user_activity(updated_attributes)
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  

  def after_update_path_for(resource)
    admin_profile_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  private

  def set_layout
    if action_name == "edit" || action_name == "update"
      self.class.layout "admin"
    else
      self.class.layout "auth"
    end
  end

   def log_user_activity(updated_attributes = {})
  return unless current_user

  activity_description = "Updated profile:"
  has_changes = false

  updated_attributes.each do |attribute_name, new_value|
    old_value = current_user[attribute_name]
    if old_value != new_value
      has_changes = true
      activity_description += "\n- #{attribute_name}: #{old_value} -> #{new_value}"
    end
  end

  if current_user.attribute_changed?(:profile_image, from: nil) || has_changes
    current_user.user_activity_logs.create(description: activity_description)
  end
end




end
