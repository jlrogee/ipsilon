require 'rails_helper'

RSpec.describe Organization, :type => :model do
  before :all do
    @organization = FactoryGirl.create :organization
  end
  it "should create factory" do
    expect(@organization).to be_valid
  end
end
