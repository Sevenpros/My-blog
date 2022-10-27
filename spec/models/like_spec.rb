require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'pic', bio: 'Teacher', posts_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'comment text')
    @like = Like.create(author_id: @user.id, post_id: @post.id)
  end

  it 'like should belong to post' do
    @like.post_id = nil
    expect(@like).to_not be_valid
  end
  it 'like should belong to author' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end
  it 'update_like_counter should be greater than 0' do
    @like.update_likes_counter
    expect(@like.post.comments_counter).to be > 0
  end
end
