require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    like = FactoryBot.build(:like)
    expect(like).to be_valid
  end

  it 'is not valid without a user' do
    like = FactoryBot.build(:like, user: nil)
    expect(like).not_to be_valid
  end

  it 'is not valid without a post' do
    like = FactoryBot.build(:like, post: nil)
    expect(like).not_to be_valid
  end
end
