class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  after_create :update_posts_counter
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.last(5).reverse
  end
end
