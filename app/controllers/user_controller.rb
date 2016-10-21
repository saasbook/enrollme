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

  
  def start_team
    @user = User.find(session[:user_id])
    @user.team = Team.create!(:passcode => User.name + "'s team hash", :approve => false)
    redirect_to team_path(:id=>@user.team.id)
  end
  
  def join_team
    @user = User.find(session[:user_id])
    @team = Team.find_by_passcode(params[:team_hash])
    @user.team = params[:team_hash]
    @team = Team.find_by_passcode(@user.team)
    
    redirect_to team_path(:id=>params[:team_hash])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :team, :sid, :major)
    end


end