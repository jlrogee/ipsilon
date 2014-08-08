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
  it { is_expected.to ensure_length_of(:country).is_at_most(250)}
  it { is_expected.to ensure_length_of(:address).is_at_most(250)}
  it { is_expected.to ensure_length_of(:orgname).is_at_most(100)}
  it { is_expected.to ensure_length_of(:phone).is_at_most(18)}
end
