class RequestsMailer < ApplicationMailer
    def send_email_to_user(user)
       @user = user
       mail(to: @user.email, subject: 'Request to join your CS169 team | EnrollMe')
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
