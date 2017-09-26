class AdminMailer < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'#, to: 'enrollmes17@gmail.com'
   
   def invite_new_admin(admin)
      @admin = admin
      @url = ENV["SERVER_EMAIL"]
      mail(to: @admin.email, subject: "Superadmin gave you access as admin for EnrollMe") do |format|
         format.html
      end
   end
   
   def team_list_email(admin, status)
      @admin = admin
      @status = status
      @url  = 'http://www.gmail.com'
      mail(to: @admin.email, subject: 'List of ' + @status.downcase + ' teams currently on EnrollMe') do |format|
        format.html
      end
   end


   def send_email_to_team(team_id, recipients, email)
      mail(to: recipients, subject: email["subject"]) do |format|
         format.text { render plain: email["content"] }
      end
   end

   
   def send_approved_email(team)
      @team = team
      
      @team.users.each do |approved_user|
         @user = approved_user
         @url = ENV["SERVER_EMAIL"]
         mail(to: @user.email, subject: 'Your team has been approved') do |format|
            format.html
         end
      end
   end
   
   def send_disapproved_email(team)
      @team = team
      
      @team.users.each do |disapproved_user|
         @user = disapproved_user
         @url = ENV["SERVER_EMAIL"]
         mail(to: @user.email, subject: 'Your team has been disapproved') do |format|
            format.html
         end
      end
   end
   
   def look_at_submission(email)
      mail(to: email, subject: "A team is awaiting your approval!")
   end
   
   def all_data(admin)
      @admin = admin
      mail(to: @admin.email, subject: 'Reset Semester: All data that was deleted') do |format|
        format.html
      end
   end
   
   def self.send_look_at_submission
      if !(Team.where("approved = ? AND submitted = ?", false, true).nil?)
         Admin.all.each do |admin|
            look_at_submission(admin.email).deliver_now
         end
      end
   end
end
