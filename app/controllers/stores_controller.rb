class StoresController < ApplicationController
  def index
    @q = Store.ransack(params[:q])
  end

  def search
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true)
  end
end
