require 'mailgun'

mg_client = Mailgun::Client.new 'your-api-key'
from_address = 'bob@sending_domain.com'
sending_domain = 'sending_domain.com'

def send(address, subject, text)
  message_params =  {
    from: from_address,
    to:   address,
    subject: subject,
    text:    text
  }
  mg_client.send_message sending_domain, message_params
end
