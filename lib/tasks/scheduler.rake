desc "This task is called by the Heroku scheduler add-on"
task :admin_emails => :environment do
  puts "Sending Emails to Admins..."
  AdminMailer.send_look_at_submission
  puts "done."
end
