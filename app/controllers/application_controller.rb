class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user


  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = 'Necesitas logearte para poder ver esta pagina'
      redirect_to login_path
    end
  end

  def require_no_user
    if current_user
      flash[:notice] = 'Tienes una session activa. No  puedes ver esta pagina'
      redirect_to root_path
    end
  end
end
