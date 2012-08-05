class UserSessionsController < ApplicationController
  before_filter :require_user,    only:   :destroy
  before_filter :require_no_user, except: [:destroy, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save ?
      redirect_to(current_user) :
      redirect_to(root_path)
  end

  def destroy
    current_user_session.destroy
    redirect_to root_url
  end

end
