class Api::UsersController < ApplicationController
  def index
    users = User.all
    render json: users

    json_file_path = Rails.root.join('public', 'users.json')

    # Write the JSON response to the file
    File.open(json_file_path, 'w') do |file|
      file.write(response.body)
    end
  end
end
