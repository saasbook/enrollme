class SessionController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    puts "ice cream", params # so it prints something here
    puts Team.all
    puts User.all
    
    user = User.find(session[:user_id])
    
    if !(user.nil?)
      session[:user_id] = user.id
      redirect_to without_team_path, notice: "Logged in!"
    else
      flash[:error] = 'invalid email or password'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
end
