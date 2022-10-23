class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy comments ]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def comments
    @post.comments.create(comment_params)

    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :content, :visible)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
