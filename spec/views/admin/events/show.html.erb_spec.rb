require 'rails_helper'

RSpec.describe "admin/events/show", type: :view do
  before(:each) do
    assign(:admin_event, Admin::Event.create!(
      name: "Name",
      description: "MyText",
      duration: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
