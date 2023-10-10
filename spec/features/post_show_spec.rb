# spec/features/post_show_spec.rb
require 'rails_helper'

RSpec.feature "Post Show Page", type: :feature do
  before do
    # Create a user and associated data (posts, comments, likes) for testing
    @user = create(:user)
    @post = create(:post, author: @user)
    create_comments_and_likes(@post, @user)
  end

  scenario "Viewing Post Details" do
    visit user_post_path(@post.author, @post)

    # Expectations for Post Details
    expect(page).to have_content(@post.title)
    expect(page).to have_content("Author: #{@user.name}")
    expect(page).to have_content("Likes: 2") # Assuming there are two likes
    expect(page).to have_content("Comments: 3") # Assuming there are three comments
    expect(page).to have_content(@post.text)
  end

  scenario "Viewing Comments" do
    visit user_post_path(@post.author, @post)

    # Expectations for Comments
    expect(page).to have_css('h3', text: 'Comments')

    within('ul') do
      # Assuming there are three comments created in the before block
      expect(page).to have_selector('li', count: 3)
      expect(page).to have_content('Username:')
      expect(page).to have_content('Comment Text 1')
      expect(page).to have_content('Comment Text 2')
      expect(page).to have_content('Comment Text 3')
    end
  end
end

# Define the 'create_comments_and_likes' method to create comments and likes for a post
def create_comments_and_likes(post, user)
  create(:like, user: user, post: post)
  create_list(:comment, 2, user: user, post: post, text: 'Comment Text')
end
