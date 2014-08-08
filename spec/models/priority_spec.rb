require 'rails_helper'

RSpec.describe Priority, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:priority)).to be_valid
  end

  it {is_expected.to validate_presence_of(:prname)}
  it {is_expected.to validate_presence_of(:days_to_close)}
  it {is_expected.to validate_numericality_of(:days_to_close)}
  it {is_expected.to ensure_length_of(:prname).is_at_least(2)}
end
