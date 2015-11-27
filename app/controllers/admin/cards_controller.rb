class Admin::CardsController < AdminController
  def show
    @card = Card.find(params[:id])
  end
  
  def index
    @cards = Card.by_created_at.page(params[:page])
  end
end
