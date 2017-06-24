Rails.application.routes.draw do

  resources :messages
  get 'sent_messages' => "messages#sent_messages"
  get 'friends' => "messages#friends"
  get 'new_messages' => "messages#new_messages"

  resources :users
  patch 'add_friend' => "users#add_friend"
  patch 'remove_friend' => "users#remove_friend"
  patch 'user_block' => "users#block"
  patch 'user_unblock' => "users#unblock"

  resources :sessions
  delete 'log_out' => 'sessions#destroy'

  get 'auth/:provider/callback' => 'sessions#callback'

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
