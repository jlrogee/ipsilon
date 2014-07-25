require 'rails_helper'

RSpec.describe Problem, :type => :model do
 # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(FactoryGirl.build(:problem)).to be_valid
  end

end
