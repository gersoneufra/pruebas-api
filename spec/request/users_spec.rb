require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/:id" do
    it "returns a specific order" do
      user = User.create(email: 'dino@admin.com', name: 'Dino')
      get "/users/#{user.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["name"]).to eq('Dino')
    end
  end
end
