class AdminsController < ApplicationController
  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :validate_admin, :set_admin
  
  def show_import
    
    # require 'net/http'
    # require 'net/https'

    # uri = URI.parse("https://apis.berkeley.edu/uat/sis/v2/enrollments/terms/2178/classes/sections/38628")
    
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    
    # request = Net::HTTP::Get.new(uri.request_uri, initheader = {"Accept" => "application/json", "app_id" => ENV["ENROLLMENT_API_APP_ID"], "app_key" => ENV["ENROLLMENT_API_APP_KEY"]})

    # response = http.request(request)
    # r = JSON.parse(response.body)
    # puts "hello"
    # puts r["apiResponse"]["responseType"]
    # puts response.body.index "169"
    # puts response.body[124000..124030]
    # puts "bye"
    
    # render :json => response.body
    render 'import'
  end
  
  def new
    @new_admin = Admin.new
    render 'new'
  end
  
  def create

    if params["type_admin"] == "ta"
      @new_admin = Admin.new(:name => params[:admin]["name"], :email => params[:admin]["email"], :TAadmin => true )
    elsif params["type_admin"] == "enroll"
      @new_admin = Admin.new(:name => params[:admin]["name"], :email => params[:admin]["email"], :enrollmeadmin => true )
    else
      redirect_to new_admin_path, :notice => "Choose an admin type"
      return
    end
    @new_admin.superadmin = false
    if session[:is_admin] == true and @new_admin.save 
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
    render 'index'
  end
  
  def unapproved
   unapproved_teams = session[:unapproved_teams]
   @unapproved_teams = []
   unapproved_teams.each do |t|
     if !t["id"].nil? then
       q = Team.find_by_id(t["id"])
       @unapproved_teams << q
     end
   end
   render 'unapproved'
  end
  
  def email
    @email = ''
    team_id = params[:team_id]
    session[:team_id] = team_id
    render 'email'
  end
  
  def create_email
    email_content = params[:email_content]
    subject = params[:subject_content]
    puts "hello"
    puts subject == ""
    puts subject
    puts "bye"
    team_id = session[:team_id]
    if email_content == ""
      redirect_to admins_email_path(team_id: team_id), notice: "You have to include email content."
      return
    end
    @email_array = User.get_all_user_emails team_id
    @email_array.each do |email_id|
      EmailStudents.email_group(email_id, email_content, subject).deliver_now
    end
   
    render 'email_success'
  end
  
  def approve
    if !@admin.TAadmin
      @team = Team.find_by_id(params[:team_id])
      @team.approved = true
      @team.save!
      if !(params[:disc].nil?)
        Team.find_by_id(params[:team_id]).approve_with_discussion(params[:disc])
      end
    end
    # message = "Your team has been approved!"
    # User.get_all_user_emails(@team.id).each do |email_id|
    #   EmailStudents.email_group(email_id, message).deliver_now
    # end
    redirect_to admins_path
  end
  
  def disapprove
    if !@admin.TAadmin
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
      Team.find_by_id(params[:team_id]).disapprove
    end
    # message = "Your team has been disapproved. If you any have questions please email Cindy Connors at csconnors@berkeley.edu."
    # User.get_all_user_emails(@team.id).each do |email_id|
    #   EmailStudents.email_group(email_id, message).deliver_now
    # end
    redirect_to admins_path
  end
  
  def undo_approve
    if !@admin.TAadmin
      @team = Team.find_by_id(params[:team_id])
      # @groupt1 = 
      # @groupt2 = 
      if Group.find_by_team1_id(params[:team_id]) != nil
        Group.find_by_team1_id(params[:team_id]).delete
      end
      if Group.find_by_team2_id(params[:team_id]) != nil
        Group.find_by_team2_id(params[:team_id]).delete
      end
      @team.approved = false
      @team.discussion_id = nil
      @team.save!
      Team.find_by_id(params[:team_id]).withdraw_approval
    end
    # message = "Your team has been unapproved. If you any have questions please email Cindy Connors at csconnors@berkeley.edu."
    # User.get_all_user_emails(@team.id).each do |email_id|
    #   EmailStudents.email_group(email_id, message).deliver_now
    # end
    redirect_to admins_path
  end
  
  def team_list_email
    @status = params[:status]
    puts "---"
    puts params
    puts "---"
    AdminMailer.team_list_email(@admin, @status).deliver_now
    puts "***"
    puts "pass"
    puts "***"
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
      User.delete_all
      Team.delete_all
      Submission.delete_all
      Discussion.delete_all
      redirect_to "/", :notice => "All data reset. Good luck with the new semester!"
    else
      redirect_to reset_semester_path, :notice => "Incorrect password"
    end
  end
  
  # TODO what type of admin should I be if I transfer control?
  def transfer
    if @admin.superadmin == true and params[:transfer_admin] != nil
      other_admin = Admin.find(params[:transfer_admin])
      
      @admin.superadmin = false
      @admin.TAadmin = false
      @admin.enrollmeadmin = true
      
      other_admin.superadmin = true
      other_admin.TAadmin = false
      other_admin.enrollmeadmin = false
      
      @admin.save!
      other_admin.save!
      notice = "Successfully transferred superadmin powers."
    elsif @admin.superadmin == true and params[:transfer_admin] == nil
      notice = "No admin selected for transfer."
    # else
    #   notice = "You don't have permission to do that."
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
      notice = "#{c} admins successfully deleted."
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
    params.require(:admin).permit(:name, :email, :type_admin)
  end  
  
  def admin_tutorial
    render 'admin_tutorial'
  end
end
