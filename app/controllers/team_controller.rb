class TeamController < ApplicationController
    
  def index
    # TODO: can refactor index and show, also join/leave team in user controller
    @user_id = session[:user_id]
    return redirect_to login_path, :notice => "Please log in" if @user_id.nil?
    
    return redirect_to admin_path(@user_id) if session[:is_admin]
    
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
    
    @discussions = Discussion.all
    
    return redirect_to '/', notice: "This team does not exist" if @team.nil?
    
    return redirect_to team_path(:id => @user.team.id), notice: "Cannot access this team" if @user.team != @team

    render "team"
  end
  
  def submit
    @user = User.find_by_id(session[:user_id])
    @team = Team.find_by_id(@user.team)
    render 'discussions'
  end
  
  def unsubmit
    @team = User.find_by_id(session[:user_id]).team
    @team.withdraw_submission
    redirect_to team_path(@team)
  end
  
  def choose_discussions
    @user = User.find_by_id(session[:user_id])
    @team = Team.find_by_id(@user.team.id)
    @application = Application.new
    @application.team = @team
    @application.discussions << Discussion.find(params["disc1"])
    @application.discussions << Discussion.find(params["disc2"])
    @application.discussions << Discussion.find(params["disc3"])
    @application.disc1id = params["disc1"]
    @application.disc2id = params["disc2"]
    @application.disc3id = params["disc3"]
    @application.save!
    @team.update(submitted: true)
    return redirect_to team_path(@team), notice: "Thanks for submitting your team for enrollment."

  end
  
  def edit
    @team = User.find_by_id(session[:user_id]).team
    @user_to_remove = User.find_by_id(params[:unwanted_user])

    if @team == @user_to_remove.team
      return redirect_to team_path(@team), notice: "Removal failed." if @team.approved
      
      notice = @team.submitted ? "Your team's submission has been withdrawn." : ""
      @team.withdraw_submission
      @user_to_remove.leave_team
      return redirect_to team_path(@team), notice: "Removed " + @user_to_remove.name + " from team. " + notice
    else
      return redirect_to team_path(@team), notice: "Removal failed"
    end
  end
  
end