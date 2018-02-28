class User < ApplicationRecord

  validates :first_name, presence: true
  validates :age, numericality: true
  has_many :addresses, dependent: :delete_all
  accepts_nested_attributes_for :addresses

  scope :childrens, -> { where('age>0 and age<8') }
  scope :adolescenents, -> { where('age > 9 and age<18') }
  scope :adults, -> { where('age>18') }

  def full_name
    [first_name,middle_name,last_name].join(" ")
  end
end
