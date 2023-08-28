class Admin::DashboardController < AdminController
  
  def index
    @total_event = Event.count
    @statistics = Transaction.statistics
  end
  
  def analytics 
    @statistics = Transaction.statistics

    @total_event = Event.count
    @transaction = Transaction.order(id: :desc).take(5)
  end

  def transactions
    @my_count = Transaction.all
    @total_transactions = @my_count.size
    @pagy, @transactions = pagy(@my_count.order(id: "DESC"), items: 7)
  end

  def profile
    @user = current_user
    @activity_logs = @user.user_activity_logs.order(created_at: :desc)
  end

end
