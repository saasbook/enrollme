class SessionController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    puts "ice cream", params # so it prints something here
    puts Team.all
    puts User.all
    byebug
    puts "find by email", User.find_by_email(params[:email])

    # params exist but for some reason User is not being created
    
    user = User.find_by_email!(params[:email])
    # user = User.find_by_email!(params[:users]) testing this through /login not /signup
    
    # user = User.find_by!(email: params[:users][:email]) #but can't find user. doesn't get saved in DB?
    
    
    ### data wonky so for now gonna do something hacky ###
    # byebug
    # puts "find by email", User.find_by_email(params[:email])

    # # params exist but for some reason User is not being created
    
    # user = User.find_by_email!(params[:email])
    ###
    # user = User.find_by_email!(params[:users]) testing this through /login not /signup
    
    # user = User.find_by!(email: params[:users][:email]) #but can't find user. doesn't get saved in DB?
    
    user = User.find(1)
    
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
