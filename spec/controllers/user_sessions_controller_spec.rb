require 'spec_helper'

describe UserSessionsController do
  describe 'GET#new' do
    subject { get :new }
    before  { subject }
    it{ assigns(:user_session).should_not be_nil }
  end

  describe 'DELETE#destroy' do
    context 'with an existing session' do
      subject { delete :destroy  }
      let(:mock_before_filter){ controller.stub(require_user: 'I dont redirect') }
      let(:user_session_stub) { stub_model(UserSession) }

      before do
        mock_before_filter
        user_session_stub.should_receive(:destroy)
        controller.stub(current_user_session: user_session_stub)
        subject
      end

      it { should redirect_to root_url }
    end
  end

end
