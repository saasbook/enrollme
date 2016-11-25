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
    @team = Team.find_by_id(params[:team_id])
    @team.approved = false
    @team.save!
    redirect_to admins_path
  end
  
  def team_list_email
    AdminMailer.team_list_email(@admin).deliver_now
    
    redirect_to admins_path
  end
  
  def superadmin
    render "super"
  end
  
  def transfer
    if @admin.superadmin == true and params[:transfer_admin] != nil
      other_admin = Admin.find(params[:transfer_admin])
      @admin.superadmin = false
      other_admin.superadmin = true
      @admin.save!
      other_admin.save!
      notice = "Successfully transferred superadmin powers."
    elsif @admin.superadmin == true and params[:transfer_admin] === nil
      notice = "No admin selected for transfer."
    else
      notice = "You don't have permission to do that."
    end
    redirect_to admins_path, :notice => notice
  end
  
  def destroy
    if @admin.superadmin == true and params[:id] != nil
      a = Admin.find(params[:id])
      a.destroy!
      notice = "You have successfully deleted #{a.name}'s account."
    elsif params[:confirm] == "true" and admin.superadmin == false
      @admin.destroy!
      notice = "You have successfully deleted your admin account."
    elsif admin.superadmin == true
      notice = "Please give someone else superadmin powers before deleting yourself."
    else
      notice = 'Please confirm that you wish to remove your admin account.'
    end
    redirect_to '/', :notice => notice
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
