require 'rails_helper'

RSpec.describe User, :type => :model do
  it { expect have_many :uploads }

  before :all do
    @first_user = FactoryGirl.create :first_user
    @second_user = FactoryGirl.create :second_user
    @end_user = FactoryGirl.create :end_user
  end

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it { expect validate_uniqueness_of(:email) }

end
