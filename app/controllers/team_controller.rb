class TeamController < ApplicationController
    
  #takes user id, finds team, and redirects to team page
  def index
    user_id = params[:uid]
    puts params
    user = User.find_by_id(user_id)
    @team = user != nil ? user.team : nil
    return redirect_to team_path({:id => @team === nil ? 1 : @team.id, :uid => user_id})
  end
  
  def show
    @team = Team.find_by_id(params[:id])
    render "team"
  end
  
  def update
  end
    
end