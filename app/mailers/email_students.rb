class EmailStudents < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'
    
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome')
    end
    
    def submit_email(user)
       @user = user
       mail(to: @user.email, subject: 'Don\'t forget to submit team for CS 169')
    end
    
    def successfully_submitted_email(team)
      @team = team
      
      @team.users.each do |user|
         @user = user
         @url = 'https://cs-169-dasolyoon.c9users.io'
         mail(to: @user.email, subject: 'Your team has successfully submitted team enrollment to EnrollMe') do |format|
            format.html
         end
      end
   end
    
end
