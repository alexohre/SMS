class Admin::StaffController < AdminController
  def index
    @staffs = User.all
  end

  def show
    @staff = User.find(params[:id])
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
