class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user

    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def goto_index
    if current_user
      redirect_to cats_url
    end
  end

end
