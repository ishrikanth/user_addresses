require 'rails_helper'

RSpec.describe User, type: :model do

	context "Positive cases" do
		it "should save data" do
			expect(FactoryBot.build(:user)).to be_valid
		end

		it "should save data" do
			user = User.create(first_name: "first",middle_name: "middle",last_name: "last_name",age: 10)
			expect(User.last).to eq(user)
		end


	end


	context "validation checks" do
		it "should validate first_name" do
			expect(FactoryBot.build(:invalid_user_invalid_name)).to_not be_valid
		end

		it "should validate age" do
			expect(FactoryBot.build(:invalid_user_inavalid_age)).to_not be_valid
		end
	end

end
