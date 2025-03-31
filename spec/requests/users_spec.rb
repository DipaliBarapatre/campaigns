# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe "Users API", type: :request do
  let!(:users) { FactoryBot.create(:user) } # Create 5 users before tests
  let(:user_id) { users.first.id } # Get the ID of the first user

  describe "GET /users" do
    it "returns all users" do
      get "/users"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "POST /users" do
    let(:valid_attributes) { { name: "John Doe", email: "john@gmail.com", campaigns_list: [{campaign_name: 'camp1', campaign_id: 'id1'}] }}

    it "creates a new user" do
      expect {
        post "/users", params: valid_attributes
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(201) # HTTP Created
    end

    it "fails to create user without a name" do
      post "/users", params:  {  name: "John Doe", email: "johngmail.com", campaigns_list: [{campaign_name: 'camp1', campaign_id: 'id1'}] } 

      expect(response).to have_http_status(422) # Unprocessable Entity
    end
  end

  describe "GET /users/filter?campaign_names=cam, camp1" do

    it "filters users by campaigns_name" do
      get "/users", params: { campaign_names: "cam1, camp1" }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to be >= 1
    end
  end
end
