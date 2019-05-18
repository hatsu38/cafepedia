# frozen_string_literal: true

class Api::PrefsController < ApplicationController
  def index
    @prefs = Pref.all
  end

  def show
    @pref = Pref.find_by(name: params[:name])
    @stores = Store.all.includes(:mainstore).where(is_open: true).where(pref_id: @pref.id)
  end
end
