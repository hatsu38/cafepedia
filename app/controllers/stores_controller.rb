class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def contact
    message = params[:contact][:message]
    email = params[:contact][:email]
    inquiry = Inquiry.new(email: email, message: message)
    InquiryMailer.send_mail(inquiry).deliver_now
  end

  def leak
    name = params[:store][:name]
    address = params[:store][:address]
    url = params[:store][:url]
    socket = params[:store][:socket]
    wifi = params[:store][:wifi]
    smoking = params[:store][:smoking]
    leak = Leak.new(name: name,
                    address: address,
                   url: url,
                   socket: socket,
                   wifi: wifi,
                   smoking: smoking)
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
end
