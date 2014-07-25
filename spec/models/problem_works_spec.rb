require 'rails_helper'

RSpec.describe ProblemWorks, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(FactoryGirl.build(:problem_work)).to be_valid
  end

end
