require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_filter :set_gon
  before_filter :set_session

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def set_session
    @session = Session.find_by_session_id(session.id)
    @card_items = @session.card_items.without_card
  end

  def set_gon
    gon.shirt_price = SHIRT_PRICE
    gon.shipping_price = SHIPPING_PRICE
  end

  def set_backgrounds
    gon.backgrounds = Background.backgrounds
  end
end
