class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @comment = Comment.new(body: comment_params[:body])
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_comments_path(params[:post_id])
    else
      # flash[:error] = "Error creating comment."
      # redirect_to '/posts'
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end
