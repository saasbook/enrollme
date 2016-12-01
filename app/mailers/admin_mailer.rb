class AdminMailer < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'
   
   def team_list_email(admin)
      @admin = admin
      @url  = 'http://www.gmail.com'
      mail(to: @admin.email, subject: 'Welcome to EnrollMe') do |format|
        format.html
      end
   end
   
   def look_at_submission(email)
      mail(to: email, subject: "Teams are awaiting your approval!")
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
            look_at_submission(admin.email).deliver
         end
      end
   end
end
