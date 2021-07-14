Rails.application.routes.draw do
  resources :themes
  resources :parties
  resources :users, only: [:new, :create, :destroy, :edit, :update, :index]

  get '/home' => 'users#show'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  

  root "sessions#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
