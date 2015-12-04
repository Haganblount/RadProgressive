class CardsController < ApplicationController
  before_action :set_backgrounds

  def new
    @card = Card.new
    gon.backgrounds = Background.backgrounds
  end

  def create
    @card = Card.new(card_params)
    @card.card_items << @session.card_items.without_card
    @card.amount = current_user.present? ? 1 : @session.total_price
    
    if @card.valid?
      @btransaction = Braintree::Transaction.sale(amount: @card.amount,
                                                  credit_card: { number: card_params[:card_number],
                                                                 expiration_year: '20' + card_params[:card_year],
                                                                 expiration_month: card_params[:card_month],
                                                                 cvv: card_params[:cvv] },
                                                  customer: { first_name: card_params[:billing_first_name],
                                                              last_name: card_params[:billing_last_name],
                                                              email: card_params[:email] },
                                                  billing: { street_address: card_params[:billing_address_1],
                                                             locality: card_params[:billing_city],
                                                             region: card_params[:billing_state],
                                                             postal_code: card_params[:billing_zip] },
                                                  options: { submit_for_settlement: true })

      
      if @btransaction.success?
        @card.braintree_id = @btransaction.transaction.id
          
        if @card.save
          CardMailer.send_card_to_user(@card).deliver
          CardMailer.send_card_to_admin(@card).deliver
        end
      else
        @card.errors.add(:card_number, @btransaction.errors.map(&:message).join(".\n"))
      end
    end

    respond_to do |format|
      format.html { respond_with @card, location: done_cards_path }
      format.js {  }
    end
  end

  def done
  end

  private

  def card_params
    params.require(:card).permit(:email, :email_confirmation, :billing_first_name, :billing_last_name,
                                 :billing_address_1, :billing_address_2, :billing_city, :billing_state, 
                                 :billing_zip, :shipping_first_name, :shipping_last_name, :shipping_address_1,
                                 :shipping_address_2, :shipping_city, :shipping_state, :shipping_zip,
                                 :card_number, :card_month, :card_year, :card_cvv)
  end
end    
