class TeamMailer < ApplicationMailer
  default from: 'enrollmeberkeley@gmail.com'

  def email_team(subject, body, reply_to, bcc)
    @body = body
    @url = ENV["SERVER_EMAIL"]
    mail(to: @url, bcc: bcc, reply_to: reply_to, subject: subject) do |format| 
      format.html
    end
  end
end
