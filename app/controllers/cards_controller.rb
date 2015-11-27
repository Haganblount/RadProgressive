class CardsController < ApplicationController
  def new
    @card = Card.new
    gon.backgrounds = Background.backgrounds
  end
end