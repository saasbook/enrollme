class AdminMailer < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'
   
   def team_list_email(admin)
      @admin = admin
      @url  = 'http://www.gmail.com'
      mail(to: @admin.email, subject: 'Welcome to EnrollMe') do |format|
        format.html
      end
   end
   
   def look_at_submission
      
   end
end
