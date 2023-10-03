require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('All Users') # Update to match your actual text
    end
  end

  describe 'GET /users/:name' do
    let(:user) { create(:user, name: 'ValidUsername') } # Replace 'ValidUsername' with an actual valid username

    it 'returns a successful response' do
      get "/users/#{user.name}"
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get "/users/#{user.name}"
      expect(response).to render_template('users/show')
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.name}"
      expect(response.body).to include('User Profile') # Update to match your actual text
    end
  end
end

