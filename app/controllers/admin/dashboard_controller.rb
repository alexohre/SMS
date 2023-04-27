class Admin::DashboardController < AdminController
  def index
  end
  
  def analytics 
  end

  def staffs 
  end

  def transactions
    
  end

  def profile
    # @user = User.all
    # @user_activities = current_user.user_activities
    @user = current_user
    @activity_logs = @user.user_activity_logs.order(created_at: :desc)
  end
end
