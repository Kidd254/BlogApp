require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:name/posts' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it 'returns a successful response' do
      user_name = CGI.escape(user.name)
      get "/users/#{user_name}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      user_name = CGI.escape(user.name)
      get "/users/#{user_name}/posts"
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /users/:name/posts/:id' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it 'returns a successful response' do
      user_name = CGI.escape(user.name)
      get "/users/#{user_name}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      user_name = CGI.escape(user.name)
      get "/users/#{user_name}/posts/#{post.id}"
      expect(response).to render_template('posts/show')
    end
  end
end
