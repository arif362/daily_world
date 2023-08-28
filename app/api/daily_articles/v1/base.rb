module DailyArticles
  module V1
    class Base < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      include ErrorHundle

      mount DailyArticles::V1::Users
    end

  end
end