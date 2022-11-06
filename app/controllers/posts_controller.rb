class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    if user_signed_in?
      redirect_to mypage_path(params[:post_id])
    elsif admin_signed_in?
      redirect_to admin_posts_path(params[:post_id])
    end
  end

  def index
    @post = Post.status_public.order(created_at: :desc)
    @posts = @post.all
    @genre = Genre.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end


  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    if @post.status_private? && @post.user != current_user
      respond_to do |format|
      format.html { redirect_to posts_path, notice: 'このページにはアクセスできません' }
      end
    end
    @user = @post.user
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
    params.require(:post).permit(:title, :body, :post_image, :camara, :lens, :iso, :f_number, :shutter_speed, :remark, :location, :shooting_datetime, :status, :user_id, :genre_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
