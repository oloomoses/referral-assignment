require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create_user }

  context 'When fetching a user' do
    before do
      login_with_api(user)

      get "/api/v1/users/#{user.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the user' do
      expect(response.body).to include(user.id.to_s)
    end
  end

  context 'When the authorization header is missing' do
    before { get "/api/v1/users/#{user.id}"}

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end
end