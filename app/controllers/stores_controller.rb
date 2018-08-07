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

end
