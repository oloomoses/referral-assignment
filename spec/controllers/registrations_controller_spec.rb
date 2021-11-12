require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  let(:user) { build_user }
  let(:existing_user) { create_user }
  let(:signup_url) { '/api/v1/signup' }
  
  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
          username: user.username,
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)      
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the user email' do
      expect(response.body).to include(user.email)
    end
  end

  context 'When an email exists' do
    before do
      post signup_url, params: {
        user: {
          username: existing_user.username,
          email: existing_user.email,
          password: existing_user.password
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end
end