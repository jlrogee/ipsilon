require 'rails_helper'

RSpec.describe Departament, :type => :model do
  before :all do
    @departament = FactoryGirl.create :departament
  end
  it "should create factory" do
    expect(@departament).to be_valid
  end
end
