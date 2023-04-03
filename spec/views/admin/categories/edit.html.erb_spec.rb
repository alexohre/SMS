require 'rails_helper'

RSpec.describe "admin/categories/edit", type: :view do
  let(:admin_category) {
    Admin::Category.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:admin_category, admin_category)
  end

  it "renders the edit admin_category form" do
    render

    assert_select "form[action=?][method=?]", admin_category_path(admin_category), "post" do

      assert_select "input[name=?]", "admin_category[name]"
    end
  end
end
