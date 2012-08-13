require 'spec_helper'

describe Program do
  context 'Associations' do
    it { should have_many :users }
    it { should have_many :schedules }
  end

  context 'Validations' do
    context 'with no broadcasters' do
      it { should_not be_valid }
    end

    context 'with broadcasters' do
      let(:user)    { FactoryGirl.build(:user)    }
      let(:program) { Program.new }

      before  { program.users << user }

      subject { program }

      it { should be_valid }
    end
  end
end
