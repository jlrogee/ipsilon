# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    factory :first_problem do
      description { Faker::Lorem.paragraph }
    end
    factory :second_problem do
      description { Faker::Lorem.paragraph }
    end
  end
end
