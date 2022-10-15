class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to ''
  end

  def index
    @posts = Post.all
  end

  def search
    if params[:keyword].present?
      @posts = Post.where("body LIKE ?", "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :camara, :lens, :iso, :f_number, :shutter_speed, :remark)
  end
end
