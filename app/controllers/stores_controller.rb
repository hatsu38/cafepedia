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

end
