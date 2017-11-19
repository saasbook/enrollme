ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => "587",
  :domain               => 'gmail.com',
  :user_name            => 'enrollmeberkeley@gmail.com',
  :password             => ENV['API_KEY'],
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}
