module ApplicationHelper
  def log_activity(description)
    current_user.user_activity_logs.create(description: description)
  end
end
