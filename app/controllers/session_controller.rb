class SessionController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # log user in and redirect to user's page
      session[:user_id] = user.id
      redirect_to user, notice: "Logged in!"
    else
      flash[:warning] = 'invalid email or password'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to user, notice: "Logged out!"
  end
  
  
end
