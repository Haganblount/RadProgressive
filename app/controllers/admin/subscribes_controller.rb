class Admin::SubscribesController < AdminController
  before_action :set_subscribe, only: [:destroy]

  def index
    @subscribes = Subscribe.by_created_at.page(params[:page])
  end

  def destroy
    @subscribe.destroy
    respond_with @subscribe, location: admin_subscribes_path
  end

  private

  def set_subscribe
    @subscribe = Subscribe.find(params[:id])
  end
end
