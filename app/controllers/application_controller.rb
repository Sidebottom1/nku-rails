class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # force_ssl
  before_action :require_login  
  private
    
  def require_admin
    unless current_user.admin?
      flash[:error] = "Unauthorized"
      redirect_to root_path # halts request cycle
    end
  end
  
  def require_login
    unless session[:user_id].present?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_path # halts request cycle
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
end
