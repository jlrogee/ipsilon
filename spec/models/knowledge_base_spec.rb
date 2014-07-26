require 'rails_helper'

RSpec.describe KnowledgeBase, :type => :model do

  it { expect have_many :uploads }

  it "has a valid factory" do
    expect(FactoryGirl.build(:first)).to be_valid
    expect(FactoryGirl.build(:second)).to be_valid
  end
end
