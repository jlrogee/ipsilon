# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(10) }
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    agree { "1" }
    role { :admin }
  end
end
