# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :priority do
    prname { Faker::Name.title }
    days_to_close 1
  end
end
