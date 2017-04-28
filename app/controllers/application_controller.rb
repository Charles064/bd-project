class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :user_logged_in?, :current_client, :client_logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_logged_in?
    !!current_user
  end 
  
  def require_user
    if !user_logged_in?
      flash[:danger] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end
  
  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end
  
  def client_logged_in?
    !!current_client
  end
  
  def require_client
    if !client_logged_in?
      flash[:danger] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end
end