require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before(:each) do
    @user = create(:user, name: 'John Doe')

    @post = create(:post, author: @user)

    create(:like, post: @post)

    create_list(:comment, 2, user: @user, post: @post, user_name: 'Commenter', text: 'Comment Text')

    visit post_path(@post)
  end

  it 'displays Post Details' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content('Author: John Doe')
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content("Title: #{@post.title}")
    expect(page).to have_content("Text: #{@post.text}")
  end

  it 'displays Comments' do
    expect(page).to have_selector('li.comment', count: 2)
    expect(page).to have_content('Username: John Doe')
    expect(page).to have_content('Comment Text')
    expect(page).to have_content('Username: Commenter')
    expect(page).to have_content('Comment Text')
  end
end
