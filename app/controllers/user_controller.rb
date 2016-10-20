class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  # def index
  #   @users = User.all
  # end
  
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

  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    @team = @user != nil ? @user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => user_id})
  end

end
