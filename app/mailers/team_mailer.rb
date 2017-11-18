# TeamMailer 
class TeamMailer < ApplicationMailer
  default from: 'enrollmeberkeley@gmail.com'

  def email_team(to, subject, body, reply_to)
    @body = body
    @url = ENV['SERVER_EMAIL']

    mail(to: to, reply_to: reply_to, subject: subject, &:html)
  end
end
