class UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_profile, only: :show

  respond_to :html

  def show
    @user = @current_user
    @programs = @user.programs
  end

  def edit
    @user = @current_user
  end

  def update
    @current_user.update_attributes(params[:user])
    respond_with @current_user
  end

  private

  def require_profile
    if !@current_user.profile.try(:complete?)
      redirect_to edit_user_path(@current_user)
    end
  end

end
