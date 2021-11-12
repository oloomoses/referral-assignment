require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create_user }

  it 'is valid with a username, an email and a password & confirmation' do
    expect(user).to be_valid
  end

  it 'is authenticable with valid password confirmation' do
    expect(user.valid_password?('123456789')).to be_truthy
  end

  describe 'Username validations' do
    it 'validates username' do
      expect(user.username).to be_present
    end
  end
end
