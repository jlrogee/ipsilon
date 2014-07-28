require 'rails_helper'

RSpec.describe Asset, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:asset)).to be_valid
  end

  let(:asset) { FactoryGirl.create :asset, type: :software }

  let(:asset) { FactoryGirl.create :asset, type: :hardware }

  it { is_expected.to belong_to :user }
end
