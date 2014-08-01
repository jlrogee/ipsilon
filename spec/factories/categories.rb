# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    catname { Faker::Name.title }
    description { Faker::Lorem.paragraph }
  end
end
