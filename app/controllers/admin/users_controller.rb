class Admin::UsersController < AdminController
  respond_to :html

  def index
    @users = User.includes(:profile).where(["users.id != ?", @current_user.id])
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with [:admin, @user]
  end

  def show
    @user = User.find(params[:id])
  end
end
