class AdminsController < ApplicationController
  
  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :validate_admin, :set_admin, :except => ['new', 'create']
  
  def new
    @admin = Admin.new
    render 'new'
  end
  
  def create
    @admin = Admin.new(admin_params)

    if session[:is_admin] == true and @admin.save
      redirect_to admins_path, :notice => "You created admin " + admin_params["name"] + " successfully!"
    else
      render 'new', :notice => "Form is invalid"
    end
  end
  
  def edit
    render 'edit'
  end
  
  def update
    @admin.update_attributes!(admin_params)
    return redirect_to admins_path
  end

  def index
    status = params[:status]
    @status = status
    @teams_li = Team.filter_by(status)
    render 'show'
  end
  
  def approve
    @team = Team.find_by_id(params[:team_id])
    @team.approved = true
    @team.save!
    redirect_to admins_path
  end
  
  def disapprove
    Team.find_by_id(params[:team_id]).withdraw_approval
    redirect_to admins_path
  end
  
  def team_list_email
    AdminMailer.team_list_email(@admin).deliver_now
    
    redirect_to admins_path
  end
  
  private

  def validate_admin
    if !(session[:is_admin])
      redirect_to '/', :notice => "Permission denied"
    end
  end

  def set_admin
    @admin = Admin.find_by_id session[:user_id]
  end
  
  def admin_params
    params.require(:admin).permit(:name, :email)
  end  
  
end
