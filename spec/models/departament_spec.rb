require 'rails_helper'

RSpec.describe Departament, :type => :model do

  it "should create factory" do
    expect(FactoryGirl.build(:departament)).to be_valid
  end
end
