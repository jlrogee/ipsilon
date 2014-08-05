# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    orgname { Faker::Name.title }
    address { Faker::Address.street_address}
    city { Faker::Address.city }
    country { Faker::Address.country }
    zipcode { Faker::Address.zip_code }
  end
end
