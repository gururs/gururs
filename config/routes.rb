Gururs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :events, only: [:index, :show]

  resources :authorizations, only: [:destroy]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'

  get '/about' => 'home#about'
end
