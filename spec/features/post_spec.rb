require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.create(name: 'Username', photo: 'https://picsum.photos/209', bio: 'User bio', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(text: 'Comment text', post: @post, author: @user)
    @like = Like.create(author: @user, post: @post)
  end

  describe 'Post index page' do
    before(:each) do
      visit "/users/#{@user.id}/posts"
    end
    it 'I can see the user\'s profile picture' do
      expect(page).to have_content 'user photo'
    end
    it 'I can see the user\'s username ' do
      expect(page).to have_content @user.name
    end
    it 'I can see the number of posts of a user has writen' do
      expect(page).to have_content @user.posts.count
    end
    it 'I can see the posts title' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content @post.title
    end
    it 'I can see the posts body' do
      expect(page).to have_content @post.text
    end
    it 'I can see the first comment of post' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content @comment.text
    end
    it 'I can see how many comments the post has' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content @post.comments.count
    end
    it 'I can see how many likes the post has' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content @post.likes.count
    end
    it 'When I click on a post, it redirects me to that post\'s show page' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content @post.title
    end
  end

  describe 'Post show page' do
    before(:each) do
      visit "/users/#{@user.id}/posts/#{@post.id}"
    end
    it "I can see the post's title" do
      expect(page).to have_content @post.title
    end
    it 'I can see who wrote the post' do
      expect(page).to have_content @user.name
    end

    it "I can see the post's body" do
      expect(page).to have_content @post.text
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content @post.likes.count
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content @comment.author.name
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content @comment.text
    end
  end
end
