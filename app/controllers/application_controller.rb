class ApplicationController < ActionController::Base
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
