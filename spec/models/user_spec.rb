require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }

  context 'Associations' do
    it { should have_many :schedules }
    it { should have_many :programs }
    it { should have_one :profile }
    it { should have_one :bio }
    it { should accept_nested_attributes_for :profile }
    it { should accept_nested_attributes_for :bio }
  end

end
