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
    @user = current_user
    @activity_logs = @user.user_activity_logs.order(created_at: :desc)
  end

  def invite
    email = invite_params[:email]

    if email == current_user.email
      flash[:alert] = "You can't invite yourself."
      redirect_to admin_staffs_path
    else
      user = User.find_by_email(email)

     if user.present?
        redirect_to admin_staffs_path, notice: "User has already been invited"
      else
        new_user = User.invite!({email: email, role: invite_params[:role]}, current_user)
        if new_user.persisted?
          flash[:notice] = "An invitation email has been sent to #{email}."
          redirect_to admin_staffs_path
        else
          flash[:alert] = "Error! Please try again."
          redirect_to admin_staffs_path
        end
      end
    end
  end

  private

  def invite_params
    params.require(:user).permit(:email, :role)
  end

end
