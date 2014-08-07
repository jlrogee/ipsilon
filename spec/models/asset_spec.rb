require 'rails_helper'

RSpec.describe Asset, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:asset)).to be_valid

  end

  let(:asset) { FactoryGirl.create :asset, type: :software }

  let(:asset) { FactoryGirl.create :asset, type: :hardware }

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:account_number) }
  it { is_expected.to validate_presence_of(:organization) }
  it { is_expected.to validate_presence_of(:user) }

end
