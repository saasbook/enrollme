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

  def update
    @admin.update_attributes!(admin_params)
    return redirect_to admins_path
  end
  
  def destroy
    @admin.destroy!
    redirect_to '/', :notice => "You have successfully deleted your admin account."
  end

  def index
    status = params[:status]
    @status = status
    @teams_li = Team.filter_by(status)
    render 'index'
  end
  
  def approve
    if !(params[:disc].nil?)
      Team.find_by_id(params[:team_id]).approve_with_discussion(params[:disc])
    end
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
    redirect_to superadmin_path, :notice => notice
  end
  
  def delete
    if @admin.superadmin == true
      c = 0
      for a in Admin.all
        if params.has_key? "delete_#{a.name}"
          a.destroy!
          c += 1
        end
      end
      
      if c == 1
        notice = "#{c} admin successfully deleted."
      else
        notice = "#{c} admins successfully deleted."
      end
    else
      notice = "You do not have sufficient permissions to do that."
    end
    redirect_to superadmin_path, :notice => notice
  end
  
  def destroy
    if @admin.superadmin == true and params[:id] != nil
      a = Admin.find(params[:id])
      a.destroy!
      notice = "You have successfully deleted #{a.name}'s account."
    elsif @admin.superadmin == false
      @admin.destroy!
      notice = "You have successfully deleted your admin account."
    elsif @admin.superadmin == true
      notice = "Please give someone else superadmin powers before deleting yourself."
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
  
  def admin_tutorial
    render 'admin_tutorial'
  end
end
