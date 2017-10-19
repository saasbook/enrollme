require 'clockwork'

include Clockwork

def schedule
    
end

every(7.days, 'Send Pending Teams Emails to Admins, Phase I', :at => '05:00') {
  time = Time.now
  if (time.month == 5 or time.month == 6 or (time.month == 4 and time.day >= 15) or (time.month == 7 and time.day <= 15) or 
      (time.month == 10 and time.day >= 15) or (time.month == 11 and time.day <= 15))
    puts "Sending Emails to Admins..."
    AdminMailer.send_look_at_submission
    puts "done." 
  end
}

every(3.days, 'Send Pending Teams Emails to Admins, Phase II', :at => '05:00') {
  time = Time.now
  if ((time.month == 7 and time.day > 15) or (time.month == 8 and time.day <= 15) or
      (time.month == 11 and time.day > 15) or time.month == 12)
    puts "Sending Emails to Admins..."
    AdminMailer.send_look_at_submission
    puts "done." 
  end
}

every(1.day, 'Send Pending Teams Emails to Admins, Adjustment Period', :at => '05:00') {
  time = Time.now
  if ((time.month == 8 and time.day > 15) or time.month == 9 or
      time.month == 1 or (time.month == 2 and time.day <= 20))
    puts "Sending Emails to Admins..."
    AdminMailer.send_look_at_submission
    puts "done." 
  end
}

