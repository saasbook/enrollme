class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate, :check_existence
 
  private

  def authenticate
    # redirect_to login_path, :notice => "Please log in" if session[:user_id].nil?
  end
  
  def check_existence
    id = session[:user_id]
    is_admin = session[:is_admin]
    redirect_to logout_path if !!(id) and ((!(is_admin) and User.find_by_id(id).nil?) or (is_admin and Admin.find_by_id(id).nil?))
  end

  
end
