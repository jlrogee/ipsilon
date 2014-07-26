# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem_work, :class => 'ProblemWorks' do
    description { Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false) }
    #upload ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/factories/anyfile.txt"), :file => "anyfile.txt")
  end
end
