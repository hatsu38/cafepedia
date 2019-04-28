# frozen_string_literal: true

module Admin
  class LeaksController < ApplicationController
    before_action :authenticate_user!

    # Storeに関して
    def index
      @leaks = Leak.page(params[:page]).per(25).order(id: :desc)
      @all_leaks = Leak.all
      respond_to do |format|
        format.html
        format.csv do
          send_data render_to_string, filename: 'leaks.csv', type: :csv
        end
      end
    end
  end
end
