require 'csv'
class FileController < ApplicationController
  def index
  end

  def download_approved_teams
    time_zone = "Pacific Time (US & Canada)"
    time_format = "%Y%m%d%H%M"
    time = Time.now.in_time_zone(time_zone).strftime(time_format)

    filename = time + '_team_info.csv'
    
    rows = []
    rows << ["Team ID", "Discussion Number", "Student ID", "Student Name"]
    Team.approved_teams.each do |t|
      discussion = Discussion.find_by_id(t.discussion_id)
      
      if(discussion.nil?)
        byebug
      end
      
      
      t.users.each do |u|
        rows << [t.id, discussion.number, u.sid, u.name]
      end
    end

    csv_str = rows.inject([]) { |csv, row|  csv << CSV.generate_line(row) }.join("")
    send_data(csv_str, type: 'text/csv', filename: filename)
  end
  
  
end
