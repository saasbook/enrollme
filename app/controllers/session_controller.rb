class SessionController < ApplicationController
  
  def create
    @user = User.where(:email => params[:email]).first
    if @user.nil? or @user.password != params[:password]
        redirect_to login_path, notice: "Invalid email or password"
        return
    end
    session[:user_id] = @user.id
    redirect_to without_team_path, notice: "Logged in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
end