class Admin::PostsController < ApplicationController
  def index
    @post = Post.status_public.order(created_at: :desc)
    @posts = @post.all
    @genre = Genre.all
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
end
