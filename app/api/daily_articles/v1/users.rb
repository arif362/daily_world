module DailyArticles
  module V1
    class Users < Base
      desc 'End-points for the Login'
      resources :users do

        desc 'Login via email and password'
        params do
          requires :email, type: String, desc: 'email'
          requires :password, type: String, desc: 'password'
          requires :full_name, type: String, desc: 'full_name'
        end
        post do
          user = User.create!(params)
          status :created
        end

        desc 'Login via email and password'
        params do
          requires :email, type: String, desc: 'email'
          requires :password, type: String, desc: 'password'
        end
        post 'login' do

          user = User.authenticate_by(email: params[:email].downcase, password: params[:password])
          error!('User not found', :not_found) unless user.present?
          token = AuthenticationToken.generate(user)

          status :ok
          present token, with: DailyArticles::V1::Entities::UserWithTokenEntity
        end
      end
    end
  end
end

