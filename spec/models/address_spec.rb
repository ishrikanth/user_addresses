require 'rails_helper'

RSpec.describe Address, type: :model do
  context "Validate Model data" do
    it "should not save whem line1 is empty" do
      expect(FactoryBot.build(:invalid_address_invalid_line1)).to_not be_valid
    end

    it "should not save when name is invalid" do
      expect(FactoryBot.build(:invalid_address_invalid_name)).to_not be_valid
    end

  end

end
