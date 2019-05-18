# frozen_string_literal: true

class PrefsController < ApplicationController
  def show
    @pref = Pref.find_by(name: params[:name])
    @stores = Store.all.includes(:mainstore, :pref).where(is_open: true).where(pref: @pref)
    @mainstores = Mainstore.all
  end
end
