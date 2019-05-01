# frozen_string_literal: true

class Api::StoresController < ApplicationController
  def index
    @stores = Store.all.includes(:mainstore).where(is_open: true)
    @mainstores = Mainstore.all
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])
  end
end
