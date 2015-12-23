class SubscribesController < ApplicationController
  def show
  end
  
  def create
    @subscribe = Subscribe.create(subscribe_params)
  end

  def subscribe_params
    params.require(:subscribe).permit(:email)
  end
end