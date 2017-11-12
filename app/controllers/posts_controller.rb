class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy]
  def index
    @posts = Post.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Your post was created"
    else
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
