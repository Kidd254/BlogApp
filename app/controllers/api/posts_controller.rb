class Api::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
    json_file_path = Rails.root.join('public', 'posts.json')

    # Write the JSON response to the file
    File.open(json_file_path, 'w') do |file|
      file.write(response.body)
    end
  end
end
