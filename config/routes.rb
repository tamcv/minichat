Rails.application.routes.draw do

  resources :messages
  get 'sent_messages' => "messages#sent_messages"
  get 'add_friends' => "messages#add_friends"
  get 'new_messages' => "messages#new_messages"

  resources :users
  resources :sessions
  delete 'log_out' => 'sessions#destroy'


  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
