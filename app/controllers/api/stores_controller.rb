# frozen_string_literal: true

class Api::StoresController < ApplicationController
  def index
    @stores = Store.all.includes(:mainstore)
    @mainstores = Mainstore.all
  end

  def show
    @store = Store.find(params[:id])
  end
end
