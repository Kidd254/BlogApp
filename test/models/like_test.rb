require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test 'user_id must be present' do
    like = Like.new(user_id: nil, post_id: 1)
    assert_not like.valid?
    assert_includes like.errors[:user_id], "can't be blank"
  end

  test 'post_id must be present' do
    like = Like.new(user_id: 1, post_id: nil)
    assert_not like.valid?
    assert_includes like.errors[:post_id], "can't be blank"
  end

  test 'user_id and post_id combination should be unique' do
    existing_like = Like.create(user_id: 1, post_id: 1)
    duplicate_like = Like.new(user_id: 1, post_id: 1)
    assert_not duplicate_like.valid?
    assert_includes duplicate_like.errors[:user_id], 'has already been taken'
  end

  test 'update_post_likes_counter should update the likes counter of the associated post' do
    post = Post.create(title: 'Test Post', author_id: 1, likes_counter: 0)
    like = Like.create(user_id: 2, post_id: post.id)
    assert_equal 1, post.reload.likes_counter
  end
end
