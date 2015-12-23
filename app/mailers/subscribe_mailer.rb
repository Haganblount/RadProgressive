class SubscribeMailer < BaseMailer
  def send_subscribe(subscribe)
    @subscribe = subscribe
    mail(to: @subscribe.email, subject: 'Thanks!')
  end
end
