require 'spec_helper'

describe Program do
  context 'Associations' do
    it { should have_many :users      }
    it { should have_many :schedules  }
    it { should have_one  :space      }
    it { should have_one  :logo       }
    it { should accept_nested_attributes_for :logo }
  end

  describe 'Validations' do
    let(:user) { build(:user)    }

    context 'with no broadcasters' do
      it { should_not be_valid }
    end

    context 'with broadcasters' do
      let(:program) { Program.new }

      before  { program.users << user }

      subject { program }

      it { should be_valid }
    end

    context 'space overlapping' do
      let(:now)   { Time.now.change(hour: 19, min: 0) }

      context 'with the same space' do
        let(:space1) { build :space, hour: now.hour, minute: now.min }
        let(:space2) { build :space, hour: now.hour, minute: now.min }

        let(:program1) { create :program, space: space1 }
        let(:program2) { create :program, space: space2 }

        it 'rejects' do
          program1.should be_valid
          expect(->{program2}).to raise_error
        end

      end

      context 'with a space on different day' do
        let(:space1) { build :space, hour: now.hour, minute: now.min, day: 1 }
        let(:space2) { build :space, hour: now.hour, minute: now.min, day: 2 }

        let(:program1) { create :program, space: space1 }
        let(:program2) { create :program, space: space2 }

        it 'accepts' do
          program1.should be_valid
          program2.should be_valid
        end
      end


    end
  end


end
