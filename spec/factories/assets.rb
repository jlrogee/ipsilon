# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    name { Faker::Name.title }
    account_number { Faker::Lorem.word }
    organization_id { |c| c.association(:organization)} #{ '1' } 
    user_id { |c| c.association(:user)} #{ '1' } 

  end
end
