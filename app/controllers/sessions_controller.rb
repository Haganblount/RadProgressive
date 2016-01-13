class SessionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  skip_before_filter :set_session 
  before_action :set_backgrounds

  def new
    if session[:session_id]
      redirect_to new_card_item_path
    else
      @session = Session.new
      gon.backgrounds = Background.backgrounds
    end
  end

  def create
    
    @session = Session.new(session_params)

    if @session.save
      session[:session_id] = @session.id
      set_session
      @card_item = CardItem.new

      if @session.subscribe
        Subscribe.where(email: @session.email).first_or_create
      end
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :email_confirmation, :subscribe)
  end
end    
