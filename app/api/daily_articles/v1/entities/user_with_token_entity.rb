module DailyArticles
  module V1
    module Entities
      class UserWithTokenEntity < Grape::Entity
        expose :token
        expose :expires_at
      end
    end
  end
end