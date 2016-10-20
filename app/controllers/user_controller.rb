class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def show
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You signed up successfully!"
    else
      # flash[:notice] = "Form is invalid"
      render "new"
    end
  end
  
  

end
