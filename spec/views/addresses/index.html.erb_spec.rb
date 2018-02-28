require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :zip => "Zip",
        :user => nil,
        :address_type => ""
      ),
      Address.create!(
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :zip => "Zip",
        :user => nil,
        :address_type => ""
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Line1".to_s, :count => 2
    assert_select "tr>td", :text => "Line2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
