class LikesController < ApplicationController
  def new
    @likes = Like.new
  end

  def create
    post = Post.find(params[:post_id])
    like = Like.new(author: current_user, post:)

    if like.save
      flash[:success] = 'Liked'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to "/users/#{post.author.id}/posts/#{post.id}"
  end
end
