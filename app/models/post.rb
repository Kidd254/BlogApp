class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_create :update_user_posts_counter

  def update_user_posts_counter
    new_posts_counter = author.posts.count
    return unless author.posts_counter != new_posts_counter

    author.update(posts_counter: new_posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
