require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John Doe', posts_counter: 0) # Set a valid value for posts_counter
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new
    expect(user).not_to be_valid
  end
end
