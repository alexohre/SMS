class TicketMailer < ApplicationMailer
  default from: 'sales@o2event.com'

  def thanks(trans)
    @trans = trans
    mail(to: @trans.email, subject: '🎉 Your Ticket Details')
  end
end
