class UsersController < ApplicationController
  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  def about
  end

  def mypage
    @user = current_user
  end
end
