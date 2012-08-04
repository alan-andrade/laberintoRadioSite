Laberintoradio::Application.routes.draw do
  [ :programacion,
    :index,
    :locutor,
    :quienes,
    :chat,
    :listeners, # This should be restricted
    :join
  ].each{|page|  get page, to: "pages##{page}" }

  root to: 'pages#index'
end
