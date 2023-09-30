require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is not valid without a user' do
    comment = FactoryBot.build(:comment, user: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post' do
    comment = FactoryBot.build(:comment, post: nil)
    expect(comment).to_not be_valid
  end
end
