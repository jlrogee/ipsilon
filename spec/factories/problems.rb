# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    description { Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false) }
    file ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/factories/anyfile.txt"), :filename => "anyfile.txt")
  end
end
