class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(body: post_params[:body])
    user = current_user
    user.posts << post
    if user.save
      redirect_to "/"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:body)
  end

end
