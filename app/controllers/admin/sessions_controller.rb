class Admin::SessionsController < AdminController
  before_action :set_sessions, only: [:destroy]

  def index
    @sessions = Session.by_created_at.page(params[:page])
  end

  def destroy
    @session.destroy
    respond_with @session, location: admin_sessions_path
  end

  private

  def set_subscribe
    @session = Session.find(params[:id])
  end
end
