require 'rails_helper'

RSpec.describe "admin/events/index", type: :view do
  before(:each) do
    assign(:admin_events, [
      Admin::Event.create!(
        name: "Name",
        description: "MyText",
        duration: 2
      ),
      Admin::Event.create!(
        name: "Name",
        description: "MyText",
        duration: 2
      )
    ])
  end

  it "renders a list of admin/events" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
