class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, { only: [:show, :edit, :update] }
  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:store_id)
    @favorite_list = Store.find(favorites)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "profileが更新されました"
      redirect_to users_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
    end
  end
end
