require 'spec_helper'

describe ProgramsController do
  let(:current_user) { FactoryGirl.build(:user) }

  context 'with logged user' do
    before{ UserSession.create current_user }

    describe 'GET#new' do
      it 'returns @users and build @program' do
        get :new
        assigns(:program).should_not be_nil
        assigns(:users).should_not be_nil
      end
    end
  end

  context 'without a logged user' do
    describe 'GET#new' do
      it 'should force login' do
        get :new
        should redirect_to login_path
      end
    end
  end
end
