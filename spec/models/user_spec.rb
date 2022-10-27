require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'pic', bio: 'Teacher', posts_counter: 0)
    @user.save
  end
  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'post_counter should be greater than 0' do
    @user.posts_counter = -5
    expect(@user).to_not be_valid
  end

  it 'post_counter should be integer' do
    @user.posts_counter = 'b'
    expect(@user).to_not be_valid
  end
  it 'three_recent_posts should return 3 recent post' do
    post_one = Post.new(author: @user, title: 'First post', text: 'First post by first user',
                        comments_counter: 0, likes_counter: 0)
    post_one.save
    post_two = Post.new(author: @user, title: 'Second post', text: 'Second post by first user',
                        comments_counter: 0, likes_counter: 0)
    post_two.save
    post_three = Post.new(author: @user, title: 'Third post', text: 'Third post by first user',
                          comments_counter: 0, likes_counter: 0)
    post_three.save
    post_four = Post.new(author: @user, title: 'Fourth post', text: 'Fourth post by first user',
                         comments_counter: 0, likes_counter: 0)
    post_four.save
    expect(@user.three_recent_posts).to eq([post_four, post_three, post_two])
  end
end
