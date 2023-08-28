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

  # We also need an invalid set of params to test
  # that Grape validates correctly
  let(:invalid_params) do
    {
      data: {}
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
        # expect(last_response.status).to eq 201
        expect(response).to have_http_status(:created)

      end
    end
  end


  it "create" do
    headers = { "ACCEPT" => "application/json" }
    post "/api/v1/users", :params => { email: "ariful.islam@misfit.tech".downcase, password: 'password', full_name: 'arif', password_confirmation: 'password' }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "creates a session" do
    headers = { "ACCEPT" => "application/json" }
    post "/api/v1/users/login", :params => { email: "ariful.islam@misfit.tech".downcase, password: 'password' }, :headers => headers

    expect(response.content_type).to eq("application/json")
  end
end
