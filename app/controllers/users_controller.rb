class UsersController < ApplicationController
  before_filter :require_user

  respond_to :html

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @current_user.update_attributes(params[:user])
    respond_with @current_user
  end

end
