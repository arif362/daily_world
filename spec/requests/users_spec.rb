require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '/api/login' do

    def api_call *params
      post "/api/login", *params
    end

    let(:email) { user.email }
    let(:password) { user.password }
    let!(:user) { create :user }
    let(:original_params) { { email: email, password: password } }
    let(:params) { original_params }

    context 'negative tests' do
      context 'missing params' do
        let(:params) { original_params.except(:password) }
        it_behaves_like '400'
        it_behaves_like 'json result'
        it_behaves_like 'contains error msg', 'password is missing'

        context 'password' do
        end
        context 'email' do
        end
      end
      context 'invalid params' do
        context 'incorrect password' do
          let(:params) { original_params.merge(password: 'invalid') }
          it_behaves_like '401'
          it_behaves_like 'json result'
          it_behaves_like 'contains error msg', 'Bad Authentication Parameters'
        end
        context 'with a non-existent login' do
        end
      end
    end


    context 'positive tests' do
      it_behaves_like '200'
      it_behaves_like 'json result'

      specify 'returns the token as part of the response' do
        api_call params
        expect(JSON.parse(response.body)['token']).to be_present
      end
      context 'valid params' do
      end
    end
  end
end