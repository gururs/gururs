Gururs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :events, only: [:index, :show]
  resources :users, only: [:index]

  resources :authorizations, only: [:destroy]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'content_pages#home'

  get '/about' => 'content_pages#about'
end
