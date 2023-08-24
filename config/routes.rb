Rails.application.routes.draw do
  namespace :admin do
    resources :admins
    resources :skills
    resources :categories
    resources :companies
  end
  resources :admins
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  get 'static_pages/home'
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :notifications
  put "account", to: "users#update"
  get "account", to: "users#edit"
  get "profile", to: "users#show"
  delete "account", to: "users#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end

  # Defines the root path route ("/")
  draw(:blog)
  draw(:job)
end
