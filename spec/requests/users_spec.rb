require 'rails_helper'

RSpec.describe "Users", type: :request do

  # We need to define a set of correct attributes to create users
  let(:attributes) do
    {
      email: 'arif@example.com',
      full_name: 'Md Ariful Islam',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  # And valid_params that use the previous attributes and
  # add the JSON API spec enveloppe
  let(:valid_params) do
   attributes
  end

  let(:valid_json_res) do
    {
      email: 'arif@example.com',
      full_name: 'Md Ariful Islam',
    }
  end

  # We also need an invalid set of params to test
  # that Grape validates correctly
  let(:invalid_params) do
    {
      full_name: 'Md Ariful Islam',
    }
  end

  before do
    headers = { "ACCEPT" => "application/json" }
  end

  describe 'POST /users' do
    # We use contexts here to separate our requests that
    # have valid parameters vs the ones that have invalid parameters
    context 'with valid attributes' do

      # Now we're using post and not get to make our requests.
      # We also pass the parameters we want
      it 'returns HTTP status 201 - Created' do
        post "/api/v1/users", :params => valid_params
        expect(response.status).to eq 201
        expect(response).to have_http_status(:created)
      end

      # After the request, we check in the database that our user
      # was persisted
      it 'creates the resource' do
        post "/api/v1/users", :params => valid_params
        user = User.find_by(email: valid_params[:email])
        expect(user).to_not eq nil
      end

      # Here we check that all the attributes were correctly assigned during
      # the creation. We could split this into different tests but I got lazy.
      it 'creates the resource with the specified attributes' do
        post "/api/v1/users", :params => valid_params
        user = User.find_by(email: valid_params[:email])
        expect(user.email).to eq attributes[:email]
      end

      # Here we check that the endpoint returns what we want, in a format
      # that follows the JSON API specification
      it 'returns the appropriate JSON document' do
        # post "/api/v1/posts/users", valid_params.to_json
        post "/api/v1/users", :params => valid_params

        user = User.first
        expect(valid_json_res).to eq({
                                 'email': user[:email],
                                 'full_name': user[:full_name],
                                   })
      end
    end

    # What happens when we send invalid attributes?
    context 'with invalid attributes' do

      # Grape should catch it and return 400!
      it 'returns HTTP status 400 - Bad Request' do
        post "/api/v1/users/", :params => invalid_params
        expect(response.status).to eq 400
      end

    end
  end
end
