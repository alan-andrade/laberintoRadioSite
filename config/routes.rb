Laberintoradio::Application.routes.draw do
  get :pending, to: 'public#pending'
  get :programacion, to: 'public#programacion'
  get :index,     to: 'public#index'
  get :locutor,   to: 'public#locutor'
  get :listeners, to: 'public#listeners'
  get 'chat',     to: 'chats#show'
  root to: 'public#index'
end
