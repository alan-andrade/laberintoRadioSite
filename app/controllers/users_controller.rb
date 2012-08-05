class UsersController < ApplicationController
  before_filter :require_user

  def new
  end

  def create
  end

  def show
    @user = @current_user
  end

  def edit
  end

  def update
  end

end
