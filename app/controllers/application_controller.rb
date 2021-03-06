require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_filter :set_session
  before_filter :set_gon
  
  protect_from_forgery with: :exception

  protected
  
  def set_session  
    @session = Session.find_by_session_id(session.id)
    @card_items = @session.try(:card_items).try(:without_card) || []
  end

  def set_gon
    if @session.present?
      gon.current_session_id = session.id
    end
    
    gon.shirt_price = SHIRT_PRICE
    gon.ga_id =  Rails.env.production? ? 'UA-71946977-1' : nil
  end

  def set_backgrounds
    gon.backgrounds = Background.backgrounds
  end
end
