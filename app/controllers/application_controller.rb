class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def index
    @user_id = session[:user_id]
    @user = User.where(:id => @user_id).first
    return redirect_to login_path if @user_id.nil? or @user.nil?

    return redirect_to without_team_path if @user.team.nil?

    return redirect_to team_path(:id => @user.team.id)
  end
  
  
end
