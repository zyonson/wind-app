class Admins::StoresController < Admins::ApplicationController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:notice] = "Storeが正常に作成されました"
      redirect_to admins_toppages_index_path
    else
      flash.now[:notice] = "Store正常に作成されませんでした"
      render :new
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :description,
    :reserve_way, :open, :holiday, :price, :near_station, :image, :space_of_surf, :prefecture)
  end
end
