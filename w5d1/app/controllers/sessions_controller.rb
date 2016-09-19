class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
      flash.now[:errors] = ["Invalid credentials"]
    end
  end

  def destroy
    logout
    @user = User.new
    render :new
  end
end
