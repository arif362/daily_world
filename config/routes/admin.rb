namespace :admin do
  get 'dashboard', to: 'admins#dashboard'
  resources :admins
  resources :skills
  resources :categories
  resources :companies
  resources :users
end