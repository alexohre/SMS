require 'rails_helper'

RSpec.describe "admin/tickets/show", type: :view do
  before(:each) do
    assign(:admin_ticket, Admin::Ticket.create!(
      name: "Name",
      price: "9.99",
      ticket_type: 1,
      vip_seats: 3,
      regular_seats: 4,
      admin_event_id: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/1/)
  end
end
