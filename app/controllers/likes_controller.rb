class LikesController < ApplicationController
  def like
    post = Post.find(params[:post_id])
    liking = Like.new(author: current_user, post:)

    if liking.save
      flash[:success] = 'Liked'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to "/users/#{post.author.id}/posts/#{post.id}"
  end
end
