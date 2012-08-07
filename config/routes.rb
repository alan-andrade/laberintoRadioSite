Laberintoradio::Application.routes.draw do
  [ :programacion,
    :index,
    :locutor,
    :quienes,
    :chat,
    :listeners, # This should be restricted
    :join
  ].each{|page|  get page, to: "pages##{page}" }

  resource :user_session
  resources :users
  resource :program

  namespace :admin do
    resources :users
  end

  match '/login'  => 'user_sessions#new',     via: :get, as: 'login'
  match '/logout' => 'user_sessions#destroy', via: :get, as: 'logout'
  match '/mi_cuenta' => 'users#show',          via: :get, as: 'myaccount'

  root to: 'pages#index'
end
