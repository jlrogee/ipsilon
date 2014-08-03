# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :knowledge_basis, :class => 'KnowledgeBase' do
    factory :kb do
      kbname { Faker::Name.title }
      type { :kb }
      description { Faker::Lorem.paragraph }
      instruction { Faker::Lorem.paragraph }
    end
    factory :instruction do
      kbname { Faker::Name.title }
      type { :inst }
      description { Faker::Lorem.paragraph }
      instruction { Faker::Lorem.paragraph }
    end
  end
end
