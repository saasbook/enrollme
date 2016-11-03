class AdminMailer < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'
   
   def welcome_email(admin)
      @admin = admin
      @url  = 'http://www.gmail.com'
      mail(to: @admin.email, subject: 'Welcome to EnrollMe') do |format|
        format.html
        format.text
      end
   end
end
