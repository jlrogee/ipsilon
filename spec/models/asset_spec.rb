require 'rails_helper'

RSpec.describe Asset, :type => :model do
  before :all do
    @asset = FactoryGirl.create :asset
  end
  it "should create factory" do
    expect(@asset).to be_valid
  end
  it "should set type" do
    @asset.type = :hardware
    expect { @asset.type = :software }.to change(@asset, :type).from('hardware').to('software')
  end

  it { is_expected.to belong_to :user }
end
