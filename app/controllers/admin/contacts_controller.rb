# frozen_string_literal: true

module Admin
  class ContactsController < ApplicationController
    before_action :authenticate_user!

    # Storeに関して
    def index
      @contacts = Inquiry.page(params[:page]).per(25).order(id: :desc)
      @all_contacts = Inquiry.all
      respond_to do |format|
        format.html
        format.csv do
          send_data render_to_string, filename: 'contacts.csv', type: :csv
        end
      end
    end
  end
end
