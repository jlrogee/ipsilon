require 'rails_helper'

RSpec.describe Priority, :type => :model do
  before :all do
    @priority = FactoryGirl.create :priority
  end
  it "should create factory" do
    expect(@priority).to be_valid
  end
end
