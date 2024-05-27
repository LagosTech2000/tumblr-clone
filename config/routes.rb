Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  root 'home#index'
  get 'home/about', to: 'home#about'
  
  get 'home/user/:id', to: 'home#user', as: 'home_user'

end
