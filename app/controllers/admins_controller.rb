class AdminsController < ApplicationController
  
  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :validate_admin, :set_admin, :except => ['new', 'create']
  
  def new
    @admin = Admin.new
    render 'new'
  end
  
  def create
    @admin = Admin.new(admin_params)
    @admin.superadmin = false
    if session[:is_admin] == true and @admin.save
      #AdminMailer.invite_new_admin(@admin).deliver_now
      redirect_to admins_path, :notice => "You created admin " + admin_params["name"] + " successfully!"
    else
      render 'new', :notice => "Form is invalid"
    end
  end

  def update
    @admin.update_attributes!(admin_params)
    return redirect_to admins_path
  end

  def index
    status = params[:status]
    @status = status
    @teams_li = Team.filter_by(status)
    
    # puts "---"
    # puts Group.all.inspect
    # puts "---"
    render 'index'
  end
  
  def email
    @email = ''
    team_id = params[:team_id]
    session[:team_id] = team_id
    render 'email'
  end
  
  def create_email
    email_content = params[:email_content]
    team_id = session[:team_id]
    @email_array = User.get_all_user_emails team_id
    @email_array.each do |email_id|
      EmailStudents.email_group(email_id, email_content).deliver_now
    end
    render 'email_success'
  end
  
  def approve
    @team = Team.find_by_id(params[:team_id])
    @team.approved = true
    @team.save!
    
    #AdminMailer.send_approved_email(@team).deliver_now
    
    if !(params[:disc].nil?)
      Team.find_by_id(params[:team_id]).approve_with_discussion(params[:disc])
    end
    redirect_to admins_path
  end
  
  def disapprove
    @team = Team.find_by_id(params[:team_id])
    @groupt1 = Group.find_by_team1_id(params[:team_id])
    @groupt2 = Group.find_by_team2_id(params[:team_id])
    if @groupt1 != nil
      @groupt1.delete
    end
    if @groupt2 != nil
      @groupt2.delete
    end
    @team.approved = false
    @team.discussion_id = nil
    @team.save!
    
    #AdminMailer.send_disapproved_email(@team).deliver_now
    
    Team.find_by_id(params[:team_id]).disapprove
    redirect_to admins_path
  end

  def undo_approve
    @team = Team.find_by_id(params[:team_id])
    @groupt1 = Group.find_by_team1_id(params[:team_id])
    @groupt2 = Group.find_by_team2_id(params[:team_id])
    if @groupt1 != nil
      @groupt1.delete
    end
    if @groupt2 != nil
      @groupt2.delete
    end
    @team.approved = false
    @team.discussion_id = nil
    @team.save!
    
    #AdminMailer.send_disapproved_email(@team).deliver_now
    
    Team.find_by_id(params[:team_id]).withdraw_approval
    redirect_to admins_path
  end
  
  def team_list_email
    #AdminMailer.team_list_email(@admin).deliver_now
    
    redirect_to admins_path
  end
  
  def superadmin
    render "super"
  end
  
  def reset_semester
    render "reset"
  end
  
  def reset_database
    @reset_password = params[:reset_password]
    if @reset_password == ENV["ADMIN_DELETE_DATA_PASSWORD"]
      #AdminMailer.all_data(@admin).deliver_now if not Rails.env.test?
      User.delete_all
      Team.delete_all
      Submission.delete_all
      Discussion.delete_all
      redirect_to "/", :notice => "All data reset. Good luck with the new semester!"
    else
      redirect_to reset_semester_path, :notice => "Incorrect password"
    end
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
    if @admin.superadmin == false
      @admin.destroy!
      notice = "You have successfully deleted your admin account."
    else
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
