require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'pic', bio: 'Teacher', posts_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
    @comment = Comment.new(author_id: @user.id, post_id: @post.id, text: 'comment text')
  end

  it 'comment should belong to post' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end
  it 'comment should belong to author' do
    @comment.author_id = nil
    expect(@comment).to_not be_valid
  end
  it 'update_counter should be greater than 0' do
    @comment.update_comments_counter
    expect(@comment.post.comments_counter).to eq(1)
  end
end
