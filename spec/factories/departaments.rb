# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :departament do
    depname { Faker::Name.title }
    association :organization
  end
end
