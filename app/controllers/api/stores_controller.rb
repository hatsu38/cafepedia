class Api::StoresController < ApplicationController
  def index
    @stores = Store.all
  end
end
