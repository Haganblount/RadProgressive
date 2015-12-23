class Admin::PrivateImagesController < AdminController
  def index
    @private_images = PrivateImage.by_position

    respond_to do |format|
      format.html
      format.text { send_data @private_images.map { |image| image.image.url(:original) }.join('/n'), filename: 'image-urls.txt' }
    end
  end

  def create
    @private_image = PrivateImage.create(image: open(background_params[:image_url]))
    @unique_id = params[:unique_id]
  end

  def destroy
    @private_image = PrivateImage.find(params[:id])
    @private_image.destroy
  end

  def positions
    PrivateImage.update_positions(params[:ids])
    render json: true
  end

  private
  
  def background_params
    params.require(:private_image).permit(:image_url)
  end
end
