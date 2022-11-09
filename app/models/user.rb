class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_action :authenticate_user!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  before_validation :set_defaults
  validates :name, presence: true
  validates :email, presence: true
  validates :posts_counter, numericality: { only_integer: true }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.last(3).reverse
  end

  private

  def set_defaults
    self.posts_counter = 0
  end
end
