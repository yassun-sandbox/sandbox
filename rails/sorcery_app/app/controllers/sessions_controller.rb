class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to user_path(user), notice: "Logged in!"
    else
      flash.now[:alert] = "Failed to login"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end
end
