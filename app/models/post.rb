class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.last(5).reverse
  end
end