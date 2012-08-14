require 'spec_helper'

describe Program do
  context 'Associations' do
    it { should have_many :users }
    it { should have_many :schedules }
    it { should have_attached_file :logo }
    it { should validate_attachment_content_type(:logo).
                allowing('image/png', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:logo).
                less_than(2.megabytes) }
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
