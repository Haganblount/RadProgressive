class Admin::BackgroundsController < AdminController
  def index
    @backgrounds = Background.by_position
  end

  def create
    @background = Background.create(image: open(background_params[:image_url]))
    @unique_id = params[:unique_id]
  end

  def destroy
    @background = Background.find(params[:id])
    @background.destroy
  end

  def positions
    Background.update_positions(params[:ids])
    render json: true
  end

  private
  
  def background_params
    params.require(:background).permit(:image_url)
  end
end
