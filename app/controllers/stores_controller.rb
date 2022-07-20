class StoresController < ApplicationController
  def index
    @q = Store.ransack(params[:q])
  end

  def show
    @store = Store.find(params[:id])
    @comments = @store.comments
    @comment = Comment.new
  end

  def search
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true)
  end
end
