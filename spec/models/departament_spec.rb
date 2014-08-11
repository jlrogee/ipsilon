require 'rails_helper'

RSpec.describe Departament, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:departament)).to be_valid
  end
  it { is_expected.to ensure_length_of(:phone).is_at_most(18)}
  it { is_expected.to ensure_length_of(:adress).is_at_most(250)}
  it { is_expected.to ensure_length_of(:city).is_at_most(250)}
  it { is_expected.to ensure_length_of(:country).is_at_most(250)}
  it { is_expected.to ensure_length_of(:depname).is_at_most(100)}
  it { is_expected.to validate_presence_of(:depname) }
  it { is_expected.to validate_presence_of(:organization_id) }
end
