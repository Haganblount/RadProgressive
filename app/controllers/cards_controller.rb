class CardsController < ApplicationController
  def new
    gon.backgrounds = Background.backgrounds
  end
end