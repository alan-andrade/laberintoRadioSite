require 'spec_helper'

describe ProgramsController do
  let(:current_user) { FactoryGirl.build(:user) }

  context 'with logged user' do
    before{ UserSession.create current_user }

    describe 'GET#new' do
      it 'returns @users and build @program' do
        get :new, user_id: current_user.id
        assigns(:program).should_not be_nil
        assigns(:users).should_not be_nil
      end
    end
  end
end
