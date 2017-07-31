class EmailStudents < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'#, to: 'enrollmes17@gmail.com'
    
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to EnrollMe')
    end
    
    def submit_email(user)
       @user = user
       mail(to: @user.email, subject: 'Don\'t forget to submit team for CS 169')
    end
    
    def successfully_submitted_email(team)
      @team = team
      @url = ENV["SERVER_EMAIL"]
      mail(to: @team.users.map { |member| member.email }, subject: 'Your team has successfully submitted team enrollment to EnrollMe') do |format|
          format.html
       end
    end
    
    def self.send_notify_emails(user, targets, body)
        targets.each do |target|
            notify_email(user, target, body).deliver_now
        end
    end
    
    def notify_email(user, target, body)
        @user = user
        @target = target  
        @body = body
        mail(to: @target.email, subject: 'You have a new incoming request')
      end
    
end
