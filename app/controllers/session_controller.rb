class SessionController < ApplicationController
  
  skip_before_filter :authenticate, :except => ['destroy']
  skip_before_filter :check_existence

  def new
    id = session[:user_id]
    if id.nil?
      render 'new'
    elsif session[:is_admin]
      return redirect_to admins_path
    else
      user = User.find_by_id(id)
      return redirect_to without_team_path if user.team.nil?
      return redirect_to team_path(user.team)
    end
  end
  
  def create
    user = User.user_from_oauth(env["omniauth.auth"])
    return redirect_to new_user_path, notice: "Account not created yet, please sign up!"
    session[:user_id] = user.id
    return redirect_to without_team_path, notice: "Logged in!" if @user.team.nil?
    return redirect_to team_path(@user.team), notice: "Logged in!"
  end
  
  def destroy
    session[:user_id] = nil
    session[:is_admin] = nil
    redirect_to login_path, notice: "Logged out!"
  end
  
end