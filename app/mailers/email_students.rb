class EmailStudents < ApplicationMailer
    default from: "support@enrollme.com"
    
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome')
    end
    
    def submit_email(user)
       @user = user
       mail(to: @user.email, subject: 'Don\'t forget to submit team for CS 169')
    end
    
    
end
