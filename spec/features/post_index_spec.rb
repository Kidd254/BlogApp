require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'PostIndices', type: :feature do
  before do
    @user = create(:user)
    create_posts_and_data(@user)
  end

  scenario 'Viewing User Profile Picture and Details' do
    visit user_posts_path(@user.username)

    expect(page).to have_selector('img.profile-picture')
    expect(page).to have_content(@user.username)
    expect(page).to have_content("Number of Posts: #{Post.where(user: @user).count}")
  end

  scenario 'Viewing Post Titles, Bodies, Comments, Likes' do
    visit user_posts_path(@user.username)

    expect(page).to have_content('Post Title 1')
    expect(page).to have_content('Post Body 1')
    expect(page).to have_content('Post Title 2')
    expect(page).to have_content('Post Body 2')
    expect(page).to have_content('1 Comment')
    expect(page).to have_content('2 Likes')
  end

  scenario 'Viewing First Comments on a Post' do
    visit user_posts_path(@user.username)


    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end

  scenario 'Viewing Redirect to Post Show Page' do
    visit user_posts_path(@user.username)

    click_link 'Post Title 1'

    expect(current_path).to eq(user_post_path(user_id: @user.username, id: Post.first.id))
    expect(page).to have_content('Post Title 1')
  end

  def create_posts_and_data(user)
    # rubocop:disable Style/HashSyntax
    post1 = create(:post, user: user, title: 'Post Title 1', body: 'Post Body 1')
    post2 = create(:post, user: user, title: 'Post Title 2', body: 'Post Body 2')

    create(:comment, user: user, post: post1, text: 'Comment 1')
    create(:comment, user: user, post: post1, text: 'Comment 2')
    create(:like, user: user, post: post1)
    create(:like, user: user, post: post2)
    # rubocop:enable Style/HashSyntax
  end
end

# rubocop:enable Metrics/BlockLength
