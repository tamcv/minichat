Rails.application.routes.draw do

  resources :messages
  #get 'sessions/new'
  delete 'log_out' => 'sessions#destroy'

  resources :users
  resources :sessions


  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
