# TeamMailer
class TeamMailer < ApplicationMailer
  default from: 'enrollmeberkeley@gmail.com'

  def email_team(to, from_name, to_name, subject, body, reply_to, team)
    @body = body
    @url = ENV['SERVER_EMAIL']
    @to_name = to_name
    @from_name = from_name
    @team = team

    puts('to')
    puts(to)

    mail(to: to, reply_to: reply_to, subject: subject, &:html)
  end
end
