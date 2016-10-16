class TeamController < ApplicationController
    
  #takes user id, finds team, and redirects to team page
  def index
    user_id = params[:uid]
    user = User.find(user_id)
    @team = user.team
    return redirect_to team_path({:id => @team.id, :uid => user_id})
  end
  
  def show
    @team = Team.find(params[:id])
    render "team"
  end
    
end