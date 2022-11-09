require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'pic', bio: 'Teacher', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
  end

  it 'Title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end
  it 'Title should contains maximum of 250' do
    @post.title = 'kdjkdljdkksdklsdfkdjlkskldklklskldkflkslkdlksldlskldklskdlkslkdlkslkdlsklkdlsklklklklsdlklldlsl
        lkjlldskdlksldklskdlskldkslkdlskdlklsdlskdlskldkslkdlskdlskldklskldklskdlksldklskdfajf;aiejfoajdjfad;akd;aa
        ada;kda;kdja;ksjdjak;dak;ka;kdjaioehaghdajfahaijfajdak;ghadjadkad;ak;dkfa;dkfjakdsfiaedkghdjfakdlskdjaldkadkad
        dka;dka;sdk;aksd;akdla;kdka;kd;akda;ka;'
    expect(@post).to_not be_valid
  end
  it 'comments_counter should be greater than or equal to 0' do
    @post.comments_counter = 5
    expect(@post).to be_valid
  end

  it 'comments_counter should be integer' do
    @post.comments_counter = 1
    expect(@post).to be_valid
  end
  it 'likes_counter should be greater than 0' do
    @post.likes_counter = 5
    expect(@post).to be_valid
  end

  it 'likes_counter should be integer' do
    @post.likes_counter = 0
    expect(@post).to be_valid
  end
end
