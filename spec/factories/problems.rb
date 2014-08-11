# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    description { Faker::Lorem.paragraph }
    category { |c| c.association(:category)}
    create_user_id { 1 }
  end
end
