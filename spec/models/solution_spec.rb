require 'rails_helper'

RSpec.describe Solution, :type => :model do
  it "has a valid factory"do
    expect(FactoryGirl.build(:solution)).to be_valid
  end

  it { is_expected.to belong_to(:create_user).class_name('User') }
  it { is_expected.to belong_to(:problem).class_name('Problem') }
  it { is_expected.to have_many(:uploads).class_name('Upload') }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to ensure_length_of(:description).is_at_most(65500)}

end
