# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :departament do
    depname { Faker::Name.title }
    association :organization
    adress { Faker::Address.street_address}
    city { Faker::Address.city }
    country { Faker::Address.country }
    zipcode { Faker::Address.zip_code }

  end
end
