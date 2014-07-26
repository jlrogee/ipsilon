# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upload do
    avatar Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/test.png')))
  end
end
