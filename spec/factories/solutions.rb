# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    description { Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false) }
  end
end
