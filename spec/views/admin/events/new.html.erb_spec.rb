require 'rails_helper'

RSpec.describe "admin/events/new", type: :view do
  before(:each) do
    assign(:admin_event, Admin::Event.new(
      name: "MyString",
      description: "MyText",
      duration: 1
    ))
  end

  it "renders new admin_event form" do
    render

    assert_select "form[action=?][method=?]", admin_events_path, "post" do

      assert_select "input[name=?]", "admin_event[name]"

      assert_select "textarea[name=?]", "admin_event[description]"

      assert_select "input[name=?]", "admin_event[duration]"
    end
  end
end
