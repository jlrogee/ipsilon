require 'rails_helper'

RSpec.describe Upload, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:upload)).to be_valid
  end
end
