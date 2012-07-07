Laberintoradio::Application.routes.draw do
  get :pending, to: 'pages#pending'
  get :programacion, to: 'pages#programacion'
  get :index,     to: 'pages#index'
  get :locutor,   to: 'pages#locutor'
  get :listeners, to: 'pages#listeners'
  get :quienes,   to: 'pages#quienes'
  get :chat,      to: 'chats#show'
  root to: 'pages#index'
end
