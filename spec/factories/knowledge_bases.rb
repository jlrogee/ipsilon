# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :knowledge_basis, :class => 'KnowledgeBase' do
    factory :kb do
      kbname { Faker::Name.title }
      type { :kb }
      description { Faker::Lorem.paragraph(paragraph_count = 3, supplemental = false) }
      instruction { Faker::Lorem.paragraph(paragraph_count = 3, supplemental = false) }
    end
    factory :instruction do
      kbname { Faker::Name.title }
      type { :inst }
      description { Faker::Lorem.paragraph(paragraph_count = 3, supplemental = false) }
      instruction { Faker::Lorem.paragraph(paragraph_count = 3, supplemental = false) }
    end
  end
end
