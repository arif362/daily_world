require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "create" do
    headers = { "ACCEPT" => "application/json" }
    post "/api/v1/users", :params => { email: "ariful.islam@misfit.tech".downcase, password: 'password', full_name: 'arif' }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "creates a session" do
    headers = { "ACCEPT" => "application/json" }
    post "/api/v1/users/login", :params => { email: "ariful.islam@misfit.tech".downcase, password: 'password' }, :headers => headers

    expect(response.content_type).to eq("application/json")
  end
end
