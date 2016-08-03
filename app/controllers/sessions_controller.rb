class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      render json: "Credentials are wrong"
    end
  end

  def destory
    if @current_user
      @current_user.reset_session_token!
      session[:session_token] = nil
    end
  end

end
