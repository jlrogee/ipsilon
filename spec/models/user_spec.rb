require 'rails_helper'

RSpec.describe User, :type => :model do

  it { expect have_many :uploads }
  it { expect have_many :create_kb }
  it { expect have_many :update_kb }
  it { expect have_many :create_pb }
  it { expect have_many :update_pb }
  it { expect have_many :performer_pb }
  it { expect have_many :solutions }

  it "has a valid factory user" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it {is_expected.to validate_presence_of(:role)}
  it {is_expected.to ensure_inclusion_of(:role).in_array(%w(user admin spec dispatcher))}
  it {should validate_acceptance_of :agree }

  let(:user) { FactoryGirl.create :user, role: :user }
  let(:user) { FactoryGirl.create :user, role: :spec }
  let(:user) { FactoryGirl.create :user, role: :dispatcher }

end
