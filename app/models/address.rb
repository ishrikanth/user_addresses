class Address < ApplicationRecord
  belongs_to :user

  validates :line1,:line2,:city,:state,:country,:zip, presence:true
  validates :name, inclusion: {in: ["home","office","shipping","billing"]}

  #enum name: [:home,:office,:shipping,:billing]
end
