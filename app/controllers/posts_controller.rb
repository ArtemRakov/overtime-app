class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update, :approve]
  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(10)
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
    authorize @post
  end

  def update
    authorize @post
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

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: "The post was approved"
  end

  private
  def post_params
    params.require(:post).permit(:date, :work_performed, :status, :daily_hours)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
