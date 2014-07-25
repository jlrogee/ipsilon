require 'rails_helper'

RSpec.describe User, :type => :model do
  before :all do
    @first_user = FactoryGirl.create :first_user
    @second_user = FactoryGirl.create :second_user
    @end_user = FactoryGirl.create :end_user
  end
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(FactoryGirl.build(:first_user)).to be_valid
  end
  it { expect validate_uniqueness_of(:email) }
end
