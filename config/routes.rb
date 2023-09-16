Rails.application.routes.draw do
  root 'static_pages#home'
  namespace :host do
    resources :listings
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
