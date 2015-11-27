class CardItemsController < ApplicationController
  before_action :set_card_item, only: [:destroy, :update]
  before_action :set_backgrounds

  def new
    @card_item = CardItem.new
  end

  def create
    @card_item = @session.card_items.create(card_item_params)
  end

  def update
    @card_item.update(card_item_params)
  end

  def destroy
    @card_item.destroy
  end

  private 

  def set_card_item
    @card_item = @session.card_items.find(params[:id])
  end

  def card_item_params
    params.require(:card_item).permit(:size, :count)
  end
end