require 'spec_helper'

describe UsersController do
  describe ' GET#mi_cuenta (show)' do
    let(:user) { FactoryGirl.build(:user) }

    context 'with a logged in user' do
      subject { get :show }
      before  { @current_user = user }

      it{ response.should be_successful }
    end
  end
end
