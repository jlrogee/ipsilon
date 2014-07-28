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
  it '#switch_to_w changes state to work from new, returned, dispath, closed and done' do
    @problem.state = 'new'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('new').to('work')

    @problem.state = 'returned'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('returned').to('work')

    @problem.state = 'dispath'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('dispath').to('work')

    @problem.state = 'done'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('done').to('work')

    @problem.state = 'closed'
    expect { @problem.send("switch_to_w") }.to change(@problem, :state).from('closed').to('work')
  end

  it '#switch_to_r changes state to returned from work and dispath' do
    @problem.state = "work"
    expect { @problem.send("switch_to_r") }.to change(@problem, :state).from('work').to('returned')

    @problem.state = 'dispath'
    expect { @problem.send("switch_to_r") }.to change(@problem, :state).from('dispath').to('returned')
  end

  it '#switch_to_d changes state to dispath from work and returned' do
    @problem.state = 'work'
    expect { @problem.send("switch_to_d") }.to change(@problem, :state).from('work').to('dispath')

    @problem.state = 'returned'
    expect { @problem.send("switch_to_d") }.to change(@problem, :state).from('returned').to('dispath')
  end

  it '#switch_to_dn changes state work to done' do
    @problem.state = "work"
    expect { @problem.send("switch_to_dn") }.to change(@problem, :state).from('work').to('done')
  end

  it '#switch_to_c changes state to closed from returned, done and dispath' do
    @problem.state = 'returned'
    expect { @problem.send("switch_to_c") }.to change(@problem, :state).from('returned').to('closed')

    @problem.state = 'done'
    expect { @problem.send("switch_to_c") }.to change(@problem, :state).from('done').to('closed')

    @problem.state = 'dispath'
    expect { @problem.send("switch_to_c") }.to change(@problem, :state).from('dispath').to('closed')
  end

  it { is_expected.to belong_to(:create_user).class_name('User') }
  it { is_expected.to belong_to(:last_update_user).class_name('User') }
  it { is_expected.to belong_to(:performer_user).class_name('User') }

end
