require 'rails_helper'

RSpec.describe Priority, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:priority)).to be_valid
  end
end
