class SessionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  skip_before_filter :set_session 
  before_action :set_backgrounds

  def new
    if session[:s_id].nil?
      @session = Session.new
      gon.backgrounds = Background.backgrounds
    else
      redirect_to new_card_item_path
    end
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      session[:s_id] = @session.id
      
      if @session.subscribe
        Subscribe.where(email: @session.email).first_or_create
      end

      redirect_to new_card_item_path(send_goal: true)
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :email_confirmation, :subscribe)
  end
end    
