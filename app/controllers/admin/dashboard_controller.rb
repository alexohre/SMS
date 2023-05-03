class Admin::DashboardController < AdminController
  def index
  end
  
  def analytics 
  end

  def transactions
    
  end

  def profile
    @user = current_user
    @activity_logs = @user.user_activity_logs.order(created_at: :desc)
  end

end
