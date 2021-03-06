Rails.application.routes.draw do
  
  # resources :themes
  resources :parties do
    resources :comments, only: [:show, :edit, :update, :destroy, :new]
  end

  
  resources :comments, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :destroy, :update, :show]
  resources :rsvps, only: [:new, :create, :destroy]
  resources :hosts, :controller => 'users', type: "Host"
  resources :guests, :controller => 'users', type: "Guest"
  
  get '/home' => 'users#index'
  get '/users' => 'users#new'
  get '/user/edit' => 'users#edit'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #need to delete this logout get path later on
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#facebook_omniauth'
  get '/auth/google_oauth2/callback' => 'sessions#google_omniauth' 

  root "sessions#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
