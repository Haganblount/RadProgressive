require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_filter :set_session
  before_filter :set_gon
  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def set_session
    @session = Session.find_by_session_id(session.id)
    @card_items = @session.try(:card_items).try(:without_card) || []
  end

  def set_gon
    gon.shirt_price = SHIRT_PRICE
    gon.current_session_id = session.id
    gon.ga_id = 'UA-71946977-1'
  end

  def set_backgrounds
    gon.backgrounds = Background.backgrounds
  end
end
