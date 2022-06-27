class Admins::StoresController < Admins::ApplicationController
  def index
    @stores = Store.all
  end

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

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:notice] = "Storeが更新されました"
      redirect_to admins_toppages_index_path
    else
      flash[:notice] = "Storeの更新に失敗しました"
      render :edit
    end
  end

  # def destroy
  #  @store = Store.find(params[:id])
  #  @store.destroy
  #  flash[:notice] = "Storeが削除されました"
  #  redirect_to admins_toppages_index_path
  # end

  private

  def store_params
    params.require(:store).permit(:name, :address, :description,
    :reserve_way, :open, :holiday, :price, :near_station, :image, :space_of_surf, :prefecture, :store_url)
  end
end
