require 'spec_helper'

describe UsersController do
  describe ' GET#mi_cuenta (show)' do
    let(:stubbed_user) { stub_model(User) }
    context 'with a logged id user' do
      subject { get :show }

      before do
        controller.stub(require_user: stubbed_user)
        subject
      end

      it{ response.should be_successful }
    end
  end
end
