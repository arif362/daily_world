class User < Grape::API
  format :json
  desc 'End-points for the Login'
  namespace :user do
    desc 'Login via email and password'
    params do
      requires :email, type: String, desc: 'email'
      requires :password, type: String, desc: 'password'
    end
    post 'login' do
      user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
      if user.present?
        token = user.authentication_tokens.valid.first || AuthenticationToken.generate(user)
        status 200
        present token.user, with: Entities::UserWithTokenEntity
      else
        error_msg = 'Bad Authentication Parameters'
        error!({ 'error_msg' => error_msg }, 401)
      end
    end
  end
end