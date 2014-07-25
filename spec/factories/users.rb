# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :first_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
    end
    factory :second_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
    end
    factory :end_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
    end
  end
end
