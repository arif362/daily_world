Rails.application.routes.draw do
  resources :notifications
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  draw(:blog)
end
