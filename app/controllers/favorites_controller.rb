class FavoritesController < ApplicationController
  before_action :set_store
  def create
    @favorite = Favorite.create(user_id: current_user.id, store_id: @store.id)
    redirect_to store_path(set_store)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, store_id: @store.id)
    @favorite.destroy
    redirect_to store_path(set_store)
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end
end
