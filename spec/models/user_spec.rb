require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }

  describe 'has one profile' do
    before  { user.build_profile  }
    subject { user.profile        }
    it { should_not be_nil }
  end

  describe 'has one program' do
    before  { user.build_program  }
    subject { user.program        }
    it      { should_not be_nil   }
  end

end
