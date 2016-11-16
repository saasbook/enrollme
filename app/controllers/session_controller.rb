class SessionController < ApplicationController
  
  skip_before_filter :authenticate, :except => ['destroy']

  def new
    id = session[:user_id]
    if id.nil?
      render 'new'
    elsif session[:is_admin]
      return redirect_to admin_path(:id => session[:user_id])
    else
      user = User.find_by_id(id)
      return redirect_to without_team_path if user.team.nil?
      return redirect_to team_path(user.team)
    end
  end
  
  def create
    @user = User.find_by_email(params[:email])
    @admin = Admin.find_by_email(params[:email])

    if (@user.nil? or @user.password != params[:password]) and (@admin.nil? or @admin.password != params[:password])
      return redirect_to login_path, notice: "Invalid email or password"
    elsif @user.nil?
      session[:user_id] = @admin.id
      session[:is_admin] = true
      return redirect_to admin_path(:id => @admin.id), notice: "Logged in!"
    else
      session[:user_id] = @user.id
      return redirect_to without_team_path, notice: "Logged in!" if @user.team.nil?
      return redirect_to team_path(@user.team), notice: "Logged in!"
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:is_admin] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end