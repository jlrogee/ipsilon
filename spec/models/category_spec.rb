require 'rails_helper'

RSpec.describe Category, :type => :model do

  it { expect have_many :problems }

  it "should create factory" do
    expect(FactoryGirl.build(:category)).to be_valid

  end

  it { is_expected.to validate_presence_of(:catname) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to ensure_length_of(:catname).is_at_most(100)}
  it { is_expected.to ensure_length_of(:description).is_at_most(250)}

end
