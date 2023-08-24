root "blog/articles#index"
# config/routes.rb
direct :cdn_image do |model, options|
  if model.respond_to?(:signed_id)
    route_for(
      :rails_service_blob_proxy,
      model.signed_id,
      model.filename,
      options.merge(host: ENV['CDN_HOST'])
    )
  else
    signed_blob_id = model.blob.signed_id
    variation_key  = model.variation.key
    filename       = model.blob.filename

    route_for(
      :rails_blob_representation_proxy,
      signed_blob_id,
      variation_key,
      filename,
      options.merge(host: ENV['CDN_HOST'])
    )
  end
end

scope module: 'blog' do
  shallow do
    concern :commentable do
      resources :comments
    end

    resources :articles, concerns: :commentable do
      root to: "blog/articles#index"
      member do
        get 'download_pdf'
        get 'view_pdf', to: 'articles#view_pdf', as: :pdf_mode
      end
    end


    resources :authors, concerns: :commentable, path_names: { new: 'make', edit: 'change' }
  end
end