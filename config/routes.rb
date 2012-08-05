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

  match '/login'  => 'user_sessions#new',     via: :get, as: 'login'
  match '/logout' => 'user_sessions#destroy', via: :get, as: 'logout'

  root to: 'pages#index'
end
