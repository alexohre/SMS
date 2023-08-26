class PaymentController < ApplicationController

  def purchase
    first_name = params[:first_name]
    last_name = params[:last_name]
    event_name = params[:event_name]
    ticket_type = params[:ticket_type]
    amount = params[:ticket_price]
    phone = params[:phone]

    # Check if the seat for the ticket type is available
    ticket = Ticket.find_by(name: event_name, ticket_type: ticket_type)
    
    if ticket

      if (ticket_type == "VIP" && ticket.vip_seats > 0) || (ticket_type == "Regular" && ticket.regular_seats > 0)
        
        if ticket_type == "VIP"
          ticket.update(vip_seats: ticket.vip_seats - 1)
        else
          ticket.update(regular_seats: ticket.regular_seats - 1)
        end
        # Create a transaction record
        trans = Transaction.create!(
          ticket_no: SecureRandom.hex(6).upcase,
          first_name: first_name,
          last_name: last_name,
          event_name: event_name,
          ticket_type: ticket_type,
          amount: amount,
          phone: phone
        )

        @ticket_no = trans.ticket_no
        @name = "#{trans.first_name} #{trans.last_name}"
        @ticket_type = trans.ticket_type
        @amount_paid = trans.amount
        # Redirect to a success page or show a success message
        redirect_to payment_success_payment_path(ticket_no: trans.ticket_no)
        flash[:notice] = "Purchase successful!"
      else
        # Redirect with an error message indicating no available seats
        flash[:error] = "Sorry, no available seats for this ticket type."
        redirect_to event_url(@event)
      end
    else
      # Redirect with an error message for invalid ticket type
      flash[:error] = "Invalid ticket type."
      redirect_to event_url(@event)
    end
  end


  def payment_success
    ticket_no = params[:ticket_no]
    new_trans = Transaction.find_by(ticket_no: ticket_no)
    
    if new_trans 
      event = Event.find_by(name: new_trans.event_name)
      @event_photo = event&.photo # Assign the event photo attachment
      @event_name = new_trans.event_name
      @ticket_no = new_trans.ticket_no
      @name = "#{new_trans.first_name} #{new_trans.last_name}"
      @ticket_type = new_trans.ticket_type
      @amount_paid = new_trans.amount
    end

  end

  def payment_failure
  end
  
end
