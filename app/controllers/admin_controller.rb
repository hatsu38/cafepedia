class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = Store.limit(10).order(:id)
    @mainstores = Mainstore.all
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
      #updateが完了したら一覧ページへリダイレクト
      redirect_to admin_path
    else
      #updateを失敗すると編集ページへ
      render 'edit'
    end
  end
  private
  def store_params
    params.require(:store).permit(:name, :prefecture, :city, :other_address,
                                  :tel, :business_hour, :chair, :hp, :wifi,
                                  :socket, :smoking, :iccard, :lat, :lng)
  end
end
