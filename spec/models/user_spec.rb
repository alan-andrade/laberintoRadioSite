require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }

  context 'Associations' do
    it { should have_many :schedules }
    it { should have_many :programs }
  end

end
