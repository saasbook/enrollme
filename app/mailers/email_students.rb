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
      
      @team.users.each do |student|
         @user = student
         @url = ENV["SERVER_EMAIL"]
         mail(to: @user.email, subject: 'Your team has successfully submitted team enrollment to EnrollMe') do |format|
            format.html
         end
      end
    end
    
    def email_group(email, message)
      subject_text = 'You have a new message for CS169 from EnrollMe'
      mail(to: email, subject: subject_text) do |format|
              format.text { render plain: message }
      end
    end
    
    
end
