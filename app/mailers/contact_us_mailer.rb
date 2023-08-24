class ContactUsMailer < ApplicationMailer
  def contact(name, email, subject, message)
    @name = name
   @subject = subject
   @message = message

    mail(
      to: "hello@o2event.com",
      from: email, # Set the "from" email address to the 'email' parameter
      subject: subject
    )
  end
end
