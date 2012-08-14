require 'spec_helper'

describe 'programs/new.html.haml' do
  subject { rendered }
  context 'As a logged in user' do
    let(:current_user){ stub_model(User) }

    before do
      assign(:program,  current_user.programs.build)
      assign(:users,    [current_user] )
      assign(:current_user,    current_user )
      render
    end

    describe 'I can create my program' do
      it 'should display the program form' do
        should include('Nombre')
        should include('Descripcion')
      end
    end
  end
end
