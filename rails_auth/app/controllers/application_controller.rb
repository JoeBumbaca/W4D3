class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?


  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redirect_logged_in
    redirect_to cats_url if logged_in?
  end

  def logged_in?
    !!current_user
  end
end
