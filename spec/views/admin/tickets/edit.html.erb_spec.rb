require 'rails_helper'

RSpec.describe "admin/tickets/edit", type: :view do
  let(:admin_ticket) {
    Admin::Ticket.create!(
      name: "MyString",
      price: "9.99",
      ticket_type: 1,
      vip_seats: 1,
      regular_seats: 1,
      admin_event: nil
    )
  }

  before(:each) do
    assign(:admin_ticket, admin_ticket)
  end

  it "renders the edit admin_ticket form" do
    render

    assert_select "form[action=?][method=?]", admin_ticket_path(admin_ticket), "post" do

      assert_select "input[name=?]", "admin_ticket[name]"

      assert_select "input[name=?]", "admin_ticket[price]"

      assert_select "input[name=?]", "admin_ticket[ticket_type]"

      assert_select "input[name=?]", "admin_ticket[vip_seats]"

      assert_select "input[name=?]", "admin_ticket[regular_seats]"

      assert_select "input[name=?]", "admin_ticket[admin_event_id]"
    end
  end
end
