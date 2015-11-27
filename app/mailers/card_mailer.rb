class CardMailer < BaseMailer
  def send_card_to_user(card)
    @card = card
    mail(to: @card.email, subject: 'You just fucking ordered the shirts below')
  end

  def send_card_to_admin(card)
    @card = card
    mail(to: admins, from: @card.email, subject: 'New order')
  end
end
