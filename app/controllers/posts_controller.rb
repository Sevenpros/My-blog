class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    # @posts = @user.three_recent_posts
    @posts = @user.posts.includes(:author)
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @comments = @post.comments.includes(:author)
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
