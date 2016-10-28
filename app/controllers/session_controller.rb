class SessionController < ApplicationController
  
  def new
    if !(session[:user_id].nil?)
      return redirect_to admin_path(:id => session[:user_id]) if session[:is_admin]
      return redirect_to team_index_path
    else
      render 'new'
    end
  end
  
  def create

    @user = User.find_by_email(params[:email])
    @admin = Admin.find_by_email(params[:email])
    

    if (@user.nil? or @user.password != params[:password]) and (@admin.nil? or @admin.password != params[:password])
      return redirect_to login_path, notice: "Invalid email or password"
    elsif @user.nil?
      session[:user_id] = @admin.id
      return redirect_to admin_path(:id => @admin.id), notice: "Logged in!"
    else
      session[:user_id] = @user.id
      return redirect_to team_index_path, notice: "Logged in!"
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:is_admin] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
end