# Preview all emails at http://localhost:3000/rails/mailers/ticket
class TicketPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket/thanks
  def thanks
    TicketMailer.thanks
  end

end
