class CardMailer < BaseMailer
  def send_card_to_user(card)
    @card = card
    mail(to: @card.email, subject: 'Bernie Fucking Sanders probably appreciates what you just did')
  end

  def send_card_to_admin(card)
    @card = card
    mail(to: admins, subject: 'New order')
  end
end
