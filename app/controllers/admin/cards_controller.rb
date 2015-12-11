class Admin::CardsController < AdminController
  def show
    @card = Card.find(params[:id])
  end
  
  def index
    @search = Card.search(params[:q])
    @cards = @search.result.by_created_at.page(params[:page]).per(50)
  end
end
