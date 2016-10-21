class UserController < ApplicationController
  # before_filter :authenticate
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    puts "fish"
    puts @user
    puts "tom brady"
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You signed up successfully!"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(movie_params)
    @team = @user != nil ? @user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => user_id})
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :team, :sid, :major)
    end


end
