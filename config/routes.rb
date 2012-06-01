Laberintoradio::Application.routes.draw do
  get :index,     to: 'public#index'
  get :locutor,   to: 'public#locutor'
  get :listeners, to: 'public#listeners'
  get 'chat',     to: 'chats#show'
  root to: 'chats#show'
end
