require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :line1 => "MyString",
      :line2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :zip => "MyString",
      :user => nil,
      :address_type => ""
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[line1]"

      assert_select "input[name=?]", "address[line2]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[country]"

      assert_select "input[name=?]", "address[zip]"

      assert_select "input[name=?]", "address[user_id]"

      assert_select "input[name=?]", "address[address_type]"
    end
  end
end
