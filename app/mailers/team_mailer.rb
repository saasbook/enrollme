# TeamMailer
class TeamMailer < ApplicationMailer
  default from: 'enrollmeberkeley@gmail.com'

  def email_team(email_team_paramters)
    @body = email_team_paramters[:body]
    @url = ENV['SERVER_EMAIL']
    @to_name = email_team_paramters[:to_name]
    @from_name = email_team_paramters[:from_name]
    @team = email_team_paramters[:team]

    to = email_team_paramters[:to]
    reply_to = email_team_paramters[:reply_to]
    subject = email_team_paramters[:subject]

    mail(to: to, reply_to: reply_to, subject: subject, &:html)
  end
end
