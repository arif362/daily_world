namespace :admin do
  get 'dashboard', to: 'admins#dashboard'
  resources :admins
  resources :articles
  resources :categories
  resources :companies
  resources :skills
  resources :users
end