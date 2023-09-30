require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'title must not be blank' do
    post = Post.new(title: '')
    assert_not post.valid?
    assert_includes post.errors[:title], "can't be blank"
  end

  test 'title must not exceed 250 characters' do
    post = Post.new(title: 'A' * 251)
    assert_not post.valid?
    assert_includes post.errors[:title], 'is too long (maximum is 250 characters)'
  end

  test 'comments_counter must be an integer greater than or equal to zero' do
    post = Post.new(comments_counter: -1)
    assert_not post.valid?
    assert_includes post.errors[:comments_counter], 'must be greater than or equal to 0'

    post.comments_counter = 10
    assert post.valid?
  end

  test 'likes_counter must be an integer greater than or equal to zero' do
    post = Post.new(likes_counter: -1)
    assert_not post.valid?
    assert_includes post.errors[:likes_counter], 'must be greater than or equal to 0'

    post.likes_counter = 5
    assert post.valid?
  end
end
