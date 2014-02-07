class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Welcome back, #{user.email}"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
    
  def destroy
    session[:user_id] = nil
    redirect_to users_path, :notice => "Logged out!"
  end
    
end