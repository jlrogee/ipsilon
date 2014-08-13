require 'rails_helper'

RSpec.describe Problem, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:problem)).to be_valid
  end

  it 'initial state should be new' do
    @problem = FactoryGirl.build(:problem)
    expect(@problem.new?).to be true
  end
  before :all do
    @problem = FactoryGirl.build(:problem)
  end
  it '#switch_to_w changes state to work from new, dispatch, closed and done' do
    @problem.state = 'new'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('new').to('work')

    @problem.state = 'dispatch'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('dispatch').to('work')

  end

  it '#switch_to_d changes state to dispatch from work' do
    @problem.state = 'work'
    expect { @problem.send("switch_to_d") }.to change(@problem, :state).from('work').to('dispatch')
  end

  it '#switch_to_c changes state to closed from work and dispatch' do
    @problem.state = 'work'
    expect { @problem.send("switch_to_c") }.to change(@problem, :state).from('work').to('closed')

    @problem.state = 'dispatch'
    expect { @problem.send("switch_to_c") }.to change(@problem, :state).from('dispatch').to('closed')
  end

  it { is_expected.to belong_to(:create_user).class_name('User') }
  it { is_expected.to belong_to(:last_update_user).class_name('User') }
  it { is_expected.to belong_to(:performer_user).class_name('User') }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to validate_presence_of(:description)}
  it { is_expected.to ensure_length_of(:description).is_at_most(65500)}
  it { is_expected.to have_many(:solutions)}
  it { is_expected.to have_many(:uploads)}
  it { is_expected.to accept_nested_attributes_for(:solutions)}
  it { is_expected.to accept_nested_attributes_for(:uploads)}
end
