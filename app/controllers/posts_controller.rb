class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  def index
    @posts = Post.posts_by current_user
  end

  def new
    @post = Post.new
  end

    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Your post was update"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path,  notice: "Your post was deleted"
  end

  private
  def post_params
    params.require(:post).permit(:date, :rationale, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
