require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    post = FactoryBot.build(:post)
    post.text = 'This is a valid post content.' # Use 'text' instead of 'content'
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = FactoryBot.build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it 'is not valid if the title length exceeds 250 characters' do
    long_title = 'A' * 251
    post = FactoryBot.build(:post, title: long_title)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = FactoryBot.build(:post, comments_counter: -1)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post = FactoryBot.build(:post, likes_counter: -1)
    expect(post).not_to be_valid
  end
end
