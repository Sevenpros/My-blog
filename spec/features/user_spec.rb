require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before :each do
    @user = User.create(name: 'Username', photo: 'user photo', bio: 'User bio', posts_counter: 0)
    @user2 = User.create(name: 'User 2', photo: 'profile pic', bio: 'user biography', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
    @post2 = Post.create(title: 'title 2', text: 'Post 2', author: @user)
    @post3 = Post.create(title: 'title 2', text: 'Post 3', author: @user)
    @comment = Comment.create(text: 'Comment text', post: @post, author: @user)
    @like = Like.create(author: @user, post: @post)
  end
  describe 'User index page' do
    before :each do
      visit users_path
    end

    it 'I can see the username of all other users' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content @user.name
      expect(page).to have_content @user2.name
    end
    it 'I can see the profile picture for each user' do
      expect(current_path).to eq(users_path)
      expect(page).to have_css("img[src*='profile pic']")
    end

    it 'I can see the number of posts each user has written' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content "Number of Posts: #{@user.posts_counter}"
      expect(page).to have_content "Number of Posts: #{@user2.posts_counter}"
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit users_path(@user)
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user))
    end
  end
  describe 'User show page' do
    before :each do
      visit "users/#{@user.id}"
    end
    # it 'I can see the user\'s profile picture.' do
    #     expect(page).to have_content @user.photo
    #   end

    it 'I can see the user\'s username.' do
      expect(page).to have_content @user.name
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content "Number of Posts :#{@user.posts_counter}"
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content @user.bio
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content @post.title
      expect(page).to have_content @post2.title
      expect(page).to have_content @post3.title
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      visit "/users/#{@user.id}/posts"
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(@post.author, @post))
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_content @user.name
    end
  end
end
