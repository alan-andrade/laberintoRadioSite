Laberintoradio::Application.routes.draw do
  get :index, controller: 'public', action: 'index'
  get :programacion, controller: 'public', action: 'programacion'
  get :program, controller: 'public', action: 'program'
  get 'chat', controller: 'chats', action: 'show'
  root to: 'chats#show'
end
