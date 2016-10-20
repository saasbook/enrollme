class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def index
  	render("layouts/application")
  end
end
