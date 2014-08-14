require 'rails_helper'

RSpec.describe KnowledgeBase, :type => :model do

  it { expect have_many :uploads }

  it "has a valid factory kb" do
    expect(FactoryGirl.build(:kb)).to be_valid
  end
  it "has a valid factory instruction" do
    expect(FactoryGirl.build(:instruction)).to be_valid
  end

  before :all do
    @kb = FactoryGirl.build(:kb)
  end

  it "should set type" do
    @kb.type = :inst
    expect { @kb.type = :kb }.to change(@kb, :type).from('inst').to('kb')
  end

  it { is_expected.to belong_to(:create_user).class_name(User) }
  it { is_expected.to belong_to(:update_user).class_name(User) }
  it { is_expected.to have_many(:uploads) }
  it { is_expected.to ensure_length_of(:kbname).is_at_most(50)}
  it { is_expected.to ensure_length_of(:description).is_at_most(65500)}
  it { is_expected.to ensure_length_of(:instruction).is_at_most(65500)}
  it { is_expected.to validate_presence_of(:kbname) }
  it { is_expected.to validate_presence_of(:instruction) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:kbname) }
end
