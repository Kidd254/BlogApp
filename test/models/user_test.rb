require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name must not be blank' do
    user = User.new(name: '')
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
  end

  test 'posts_counter must be an integer greater than or equal to zero' do
    user = User.new(posts_counter: -1)
    assert_not user.valid?
    assert_includes user.errors[:posts_counter], 'must be greater than or equal to 0'

    user.posts_counter = 10
    assert user.valid?
  end
end
