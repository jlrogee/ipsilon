require 'rails_helper'

RSpec.describe Solution, :type => :model do
  it "has a valid factory"do
    expect(FactoryGirl.build(:solution)).to be_valid
  end

  it { is_expected.to belong_to(:create_user).class_name('User') }
end
