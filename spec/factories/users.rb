# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    role { :user }
    factory :first_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
      role { :user }
    end
    factory :second_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
      role { :dispatcher }
    end
    factory :end_user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      firstname { Faker::Name.first_name }
      lastname  { Faker::Name.last_name }
      role { :spec }
    end

  end


end
