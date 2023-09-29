require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'user_id must be present' do
    comment = Comment.new(user_id: nil, post_id: 1, content: 'Test comment')
    assert_not comment.valid?
    assert_includes comment.errors[:user_id], 'can\'t be blank'
  end

  test 'post_id must be present' do
    comment = Comment.new(user_id: 1, post_id: nil, content: 'Test comment')
    assert_not comment.valid?
    assert_includes comment.errors[:post_id], 'can\'t be blank'
  end

  test 'content must not be blank' do
    comment = Comment.new(user_id: 1, post_id: 1, content: '')
    assert_not comment.valid?
    assert_includes comment.errors[:content], 'can\'t be blank'
  end

  test 'user_id and post_id combination should be unique' do
    existing_comment = Comment.create(user_id: 1, post_id: 1, content: 'Test comment 1')
    duplicate_comment = Comment.new(user_id: 1, post_id: 1, content: 'Test comment 2')
    assert_not duplicate_comment.valid?
    assert_includes duplicate_comment.errors[:user_id], 'has already been taken'
  end

  test 'update_post_comments_counter should update the comments counter of the associated post' do
    post = Post.create(title: 'Test Post', author_id: 1, comments_counter: 0)
    Comment.create(user_id: 2, post_id: post.id, content: 'Test comment')
    assert_equal 1, post.reload.comments_counter
  end
end
