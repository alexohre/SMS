require 'rails_helper'

RSpec.describe "admin/events/edit", type: :view do
  let(:admin_event) {
    Admin::Event.create!(
      name: "MyString",
      description: "MyText",
      duration: 1
    )
  }

  before(:each) do
    assign(:admin_event, admin_event)
  end

  it "renders the edit admin_event form" do
    render

    assert_select "form[action=?][method=?]", admin_event_path(admin_event), "post" do

      assert_select "input[name=?]", "admin_event[name]"

      assert_select "textarea[name=?]", "admin_event[description]"

      assert_select "input[name=?]", "admin_event[duration]"
    end
  end
end
