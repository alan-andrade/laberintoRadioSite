Laberintoradio::Application.routes.draw do
  get :index, controller: 'public', action: 'index'
  get 'chat', controller: 'chats', action: 'show'
  root to: 'chats#show'
end
