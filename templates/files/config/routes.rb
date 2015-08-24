Rails.application.routes.draw do
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'

    root to: 'dashboard#index'
  end

  root to: 'home#index'
end
