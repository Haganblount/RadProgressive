class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.by_created_at.page(params[:page])
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    respond_with @user, location: admin_users_path
  end

  def edit
  end

  def update
    @user.update(user_params)
    respond_with @user, location: admin_users_path
  end

  def destroy
    @user.destroy
    respond_with @user, location: admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
