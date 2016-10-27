class TeamController < ApplicationController
  def index
    # TODO: can refactor index and show, also join/leave team in user controller
    @user_id = session[:user_id]
    return redirect_to login_path, :notice => "Please log in" if @user_id.nil?
    
    return redirect_to admin_path(@user_id) if session[:is_admin]
    
    # @user = User.find_by_id(@user_id)
    # return redirect_to login_path if @user.nil?
    
    @user = User.find(@user_id)
    
    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?

    return redirect_to team_path(:id => @user.team.id)
  end

  def show
    @user = User.find_by_id(session[:user_id])
    return redirect_to login_path, :notice => "Please log in" if @user.nil?
    
    return redirect_to admin_path(@user.id) if session[:is_admin]

    return redirect_to without_team_path, :notice => "Your team does not exist" if @user.team.nil?
    
    @team = Team.find_by_id(params[:id])
    return redirect_to '/', notice: "This team does not exist" if @team.nil?
  
    return redirect_to team_path(:id => @user.team.id), notice: "Cannot access this team" if @user.team != @team

    render "team"
  end

  def leave
    User.find(session[:user_id]).leave_team
    return redirect_to without_team_path
  end

  def update
  end
  
  
  # TODO: edit users in the team page (for now, it's just text)
  # but we need to change that to a button + add some kind of form?
  # what were we going to do with that anyway, add/delete?
  # we could just have a "remove" button and some kind of 
  # "Are you sure?" thing--can ask MDS what he wants idk
end
