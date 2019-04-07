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
  end
end
