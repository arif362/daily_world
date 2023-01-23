root "blog/articles#index"
scope module: 'blog' do
  shallow do
    concern :commentable do
      resources :comments
    end

    resources :articles, concerns: :commentable do
      root to: "blog/articles#newsfeed"
      member do
        get 'download_pdf'
        get 'view_pdf', to: 'articles#view_pdf', as: :pdf_mode
      end
    end


    resources :authors, concerns: :commentable, path_names: { new: 'make', edit: 'change' }
  end
end