class SessionController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    puts "ice cream", params[:users][:email] # so it prints something here

    puts "find by email", User.find_by_email(params[:users][:email])
    puts params[:users]

    user = params[:users]
    # user = User.find_by!(email: params[:users][:email]) #but can't find user. doesn't get saved in DB?
    
    if user && user.authenticate(params[:users][:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Logged in!"
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
