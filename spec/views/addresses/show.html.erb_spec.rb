require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :line1 => "Line1",
      :line2 => "Line2",
      :city => "City",
      :state => "State",
      :country => "Country",
      :zip => "Zip",
      :user => nil,
      :address_type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Line1/)
    expect(rendered).to match(/Line2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
