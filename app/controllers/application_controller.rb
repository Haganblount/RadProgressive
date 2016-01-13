require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_filter :set_session
  before_filter :set_gon
  
  protect_from_forgery with: :exception

  protected
  
  def set_session  
    @session = Session.find(session[:session_id])
    @card_items = @session.try(:card_items).try(:without_card) || []
  end

  def set_gon
    if @session.present?
      gon.current_session_id = @session.id
      gon.current_session_email = @session.email
    end
    
    gon.ga_id = 'UA-71946977-1'
  end

  def set_backgrounds
    gon.backgrounds = Background.backgrounds
  end
end
