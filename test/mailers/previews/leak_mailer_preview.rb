# Preview all emails at http://localhost:3000/rails/mailers/leak_mailer
class LeakMailerPreview < ActionMailer::Preview
  def inquiry
     leak= Leak.new(name: "スターバックス金町店",
                    address: "東京都葛飾区金町2-21-5",
                    url: "http://cafepedia.jp",
                   socket: true,
                   wifi: true,
                   smoking: false)
     LeakMailer.send_mail(leak)
   end
end
