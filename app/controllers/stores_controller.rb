# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    @stores = Store.all.includes(:mainstore)
    @mainstores = Mainstore.all
  end

  def contact
    message = params[:inquiry][:message]
    email = params[:inquiry][:email]
    inquiry = Inquiry.new(email: email, message: message)
    if inquiry.save
      InquiryMailer.send_mail(inquiry).deliver_now
    else
      render :action => "index"
    end
  end

  def leak
    name = params[:leak][:name]
    address = params[:leak][:address]
    url = params[:leak][:url]
    socket = params[:leak][:socket]
    wifi = params[:leak][:wifi]
    smoking = params[:leak][:smoking]
    leak = Leak.new(name: name,
                    address: address,
                    url: url,
                    socket: socket,
                    wifi: wifi,
                    smoking: smoking)
    leak.save
    LeakMailer.send_mail(leak).deliver_now
  end

  def csv_export
    File.open('allStores.csv', 'w') do |f|
      csv_string = CSV.generate do |csv|
        csv << Store.column_names
        stores = Store.where(id: [1..4658])
        stores.each do |store|
          csv << store.attributes.values_at(*Store.column_names)
        end
      end
      f.puts csv_string
    end
  end

  private

  def inquiry_params
    params.require(:leak).permit(:email, :message)
  end
end
