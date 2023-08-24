class PagesController < ApplicationController
  
  def index
  end

  def contact

  end

  def contact_action
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    message = params[:message]

    # Check if any of the fields are empty
    if name.blank? || email.blank? || subject.blank? || message.blank?
      flash[:alert] = 'Please fill in all the fields before sending the email.'
    else

      if ContactUsMailer.contact(name, email, subject, message).deliver_now
        flash[:notice] = 'Email sent successfully!'
      else
        flash[:alert] = 'Oh oh, something went wrong please try again...'
      end

      redirect_to contact_path
    end

  end
end
