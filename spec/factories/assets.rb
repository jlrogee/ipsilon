# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    name { Faker::Name.title }
    account_number { Faker::Lorem.word }
    type { "1" }
    organization_id { "1" }
  end
end
