require 'spec_helper'

describe ProgramsController do
  describe 'POST#create' do
    context 'As a logged in user' do
      let(:current_user) { FactoryGirl.build(:user) }

      describe 'I create a new program' do
        let(:program) { stub_model(Program, name: 'Program name', description: 'Description name') }

        before do
          @current_user = current_user
          UserSession.create @current_user
        end

        subject { post :create , params: { program: { name: program.name, description: program.description } } }

        it 'and go to /program' do
          should redirect_to program_path
        end
      end
    end
  end
end
