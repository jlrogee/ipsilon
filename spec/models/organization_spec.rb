require 'rails_helper'

RSpec.describe Organization, :type => :model do
  before :all do
    @organization = FactoryGirl.create :organization
  end
  it "should create factory" do
    expect(@organization).to be_valid
  end

  it {is_expected.to validate_presence_of(:orgname)}
  it {is_expected.to validate_presence_of(:country)}
  it {is_expected.to validate_presence_of(:address)}
  it {is_expected.to validate_numericality_of(:zipcode)}
end
