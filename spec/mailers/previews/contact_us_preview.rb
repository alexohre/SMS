# Preview all emails at http://localhost:3000/rails/mailers/contact_us
class ContactUsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_us/contact
  def contact
    ContactUsMailer.contact
  end

end
