require 'rails_helper'

RSpec.describe Category, :type => :model do

  it { expect have_many :problems }

  it "should create factory" do
    expect(FactoryGirl.build(:category)).to be_valid
  end
end
