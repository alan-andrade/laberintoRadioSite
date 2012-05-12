Laberintoradio::Application.routes.draw do
  get 'chat', controller: 'chats', action: 'show'
  root to: 'chats#show'
end
