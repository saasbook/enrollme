class SessionController < ApplicationController
  
  def new
    if !(session[:user_id].nil?)
      return redirect_to team_index_path
    elsif session[:is_admin]
      return redirect_to admin_path
    else
      render 'new'
    end
  end
  
  def create
    @user = User.where(:email => params[:email]).first
    if @user.nil? or @user.password != params[:password]
        return redirect_to login_path, notice: "Invalid email or password"
    end
    session[:user_id] = @user.id
    redirect_to team_index_path, notice: "Logged in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
end