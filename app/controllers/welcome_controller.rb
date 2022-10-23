class WelcomeController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(3)
  end

  def search
    @posts = Post
      .where("title like ?", "%#{params[:search]}%")
      .or(Post.where("content like ?", "%#{params[:search]}%"))
      .order(created_at: :desc)
  end
end
