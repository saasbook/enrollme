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
    if Rails.env.test?
      user = User.user_from_oauth(OmniAuth.config.mock_auth[:google])
      admin = Admin.admin_from_oauth(OmniAuth.config.mock_auth[:google])
    else
      user = User.user_from_oauth(env["omniauth.auth"])
      admin = Admin.admin_from_oauth(env["omniauth.auth"])
    end
    session[:user_email] = env["omniauth.auth"].info.email
    if user.nil?
      if admin.nil?
        return redirect_to new_user_path, notice: "Account not created yet, please sign up!"
      else
        session[:user_id] = admin.id
        session[:is_admin] = true
        return redirect_to admins_path
      end
    else
      session[:user_id] = user.id
      return redirect_to without_team_path, notice: "Logged in!" if user.team.nil?
      return redirect_to team_path(user.team), notice: "Logged in!"  
    end
  end
  
  def destroy
    session.clear
    redirect_to login_path, notice: "Logged out!"
  end
  
end