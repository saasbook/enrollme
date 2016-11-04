class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def email(user)
    @user = user
    mail(to: @user.email, subject: 'Submit Group Form')
  end
  
  layout 'mailer'
end
