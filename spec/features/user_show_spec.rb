# spec/features/user_show_spec.rb
# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before(:each) do
    # Assuming you have a user set up for testing
    @user = create(:user)
    create_list(:post, 5, user: @user)
    visit user_path(@user)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_css('img.user-profile-picture')
  end

  scenario "I can see the user's username" do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content("Number of Posts: #{Post.where(user: @user).count}")
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content(@user.bio)
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_selector('ul.posts-list li', count: 3)
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all Posts', href: user_posts_path(@user))
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    first_post = @user.posts.first
    click_link(first_post.title)
    expect(page).to have_current_path(user_post_path(@user.name, first_post))
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link('See all Posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
# rubocop:enable Metrics/BlockLength
