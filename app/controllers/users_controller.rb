class UsersController < ApplicationController
  include Gravtastic
  is_gravtastic
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user, notice: "You have successfully created your student profile."
    else
      render 'new'
    end
  end
    
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    
    if @user == current_user && @user.update(params[:user].permit(:name, :nickname, :email, :image_url, :password_digest))
      
      redirect_to @user, notice: "You have successfully edited your profile."
    else
      render 'edit'
    end
  end
    
  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :image_url, :password, :password_confirmation)
    end
  
end
