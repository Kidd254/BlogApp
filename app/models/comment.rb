class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  validates :user, presence: true
  validates :post, presence: true
end
