desc "This task is called by the Clockwork gem"
task :admin_emails => :environment do
  time = Time.now
  if ((time.month == 5 or time.month == 6 or (time.month == 4 and time.day >= 15) or (time.month == 7 and time.day <= 15) or (time.month == 10 and time.day >= 15) or (time.month == 11 and time.day <= 15) and time.day == 1) or 
      ((time.month == 7 and time.day > 15) or (time.month == 8 and time.day <= 15) or (time.month == 11 and time.day > 15) or time.month == 12 and (time.day == 1 or time.day == 3 or time.day == 5)) or
      ((time.month == 8 and time.day > 15) or time.month == 9 or time.month == 1 or (time.month == 2 and time.day <= 20)))
    puts "Sending Emails to Admins..."
    AdminMailer.send_look_at_submission
    puts "done." 
  end
  
end
