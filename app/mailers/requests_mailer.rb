class RequestsMailer < ApplicationMailer
    def send_email_to_user(user)
       @user = user
       mail(to: @user.email, subject: 'Request to join your CS169 team | EnrollMe')
    end 
end
