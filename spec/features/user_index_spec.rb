# spec/features/user_integration_spec.rb

require 'rails_helper'

RSpec.feature 'User Integration', type: :feature do
  before(:each) do
    # Assuming you have users and posts set up for testing
    @user = create(:user)
    create(:post, user: @user)
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    # Check if user's name is visible on the page
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the profile picture for each user' do
    # Check if user's profile picture is visible on the page
    expect(page).to have_css('img.card-img-top')
  end

  scenario 'I can see the number of posts each user has written' do
    # Assuming you have a method to display the post count
    expect(page).to have_content('Number of comments:') # Adjust as per your setup
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    find('.user-profile-link', match: :first).click
    expect(page).to have_current_path(user_path(@user))
  end
end
