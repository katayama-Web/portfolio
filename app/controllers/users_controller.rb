class UsersController < ApplicationController
  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts
    @posts = @post.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to mypage_path
  end

  def mypage
    @user = current_user
    @post = current_user.posts
    @posts = @post.all
  end

  def privates
    @posts = Post.status_private.order(created_at: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
