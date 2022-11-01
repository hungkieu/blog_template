class AdminController < ApplicationController
  def index
    @posts = Post.all
  end

  def delete
    case params[:type]
    when "post"
      Post.find(params[:id]).destroy
    when "category"
      Category.find(params[:id]).destroy
    end

    redirect_back(fallback_location: root_path)
  end
end
