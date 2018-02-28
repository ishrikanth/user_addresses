FactoryBot.define do
  factory :user_addresses do
    first_name 'F Name'
    middle_name 'M Name'
    last_name 'L Name'
    age 30
    addresses [
         {
            "shipping":{
               "line1":'Apt #14, Suite #22',
               "line2":'ABC Street, BCDTown',
               "city":'XYCity',
               "state":'Foo',
               "country":'Bar',
               "zip":'0102'
            }
         }
      ]
  end

  factory :user do
    first_name 'F Name'
    middle_name 'M Name'
    last_name 'L Name'
    age 30
  end

  factory :invalid_user_addresses do
    first_name 'F Name'
    middle_name 'M Name'
    last_name 'L Name'
    age 30
    addresses [
      shipping {
        line2 'ABC Street, BCDTown'
        city 'XYCity'
        state 'Foo'
        country 'Bar'
        zip '0o102'
      }
    ]
  end

  factory :invalid_user_invalid_name, parent: :user do
    first_name nil
  end

  factory :invalid_user_inavalid_age, parent: :user do
    age 'd'
  end
end
