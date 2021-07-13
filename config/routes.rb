Rails.application.routes.draw do
  resources :themes
  resources :parties
  resources :users

  root "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
