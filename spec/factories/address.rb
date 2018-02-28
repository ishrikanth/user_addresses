FactoryBot.define do
  factory :address do
    line1 'Apt #14, Suite #22'
    line2 'ABC Street, BCDTown'
    city 'XYCity'
    state 'Foo'
    country 'Bar'
    zip '0102'
    name 'home'
  end

  factory :invalid_address_invalid_line1, parent: :address do
    line1 nil
  end

  factory :invalid_address_invalid_name, parent: :address do
    name 'guest'
  end
end
