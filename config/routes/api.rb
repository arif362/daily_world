namespace :api do
  namespace :v1 do
    resources :articles, only: [:index, :show, :create]
  end
end