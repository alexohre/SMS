require 'rails_helper'

RSpec.describe "admin/tickets/index", type: :view do
  before(:each) do
    assign(:admin_tickets, [
      Admin::Ticket.create!(
        name: "Name",
        price: "9.99",
        ticket_type: 2,
        vip_seats: 3,
        regular_seats: 4,
        admin_event: nil
      ),
      Admin::Ticket.create!(
        name: "Name",
        price: "9.99",
        ticket_type: 2,
        vip_seats: 3,
        regular_seats: 4,
        admin_event: nil
      )
    ])
  end

  it "renders a list of admin/tickets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
