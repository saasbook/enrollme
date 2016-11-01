class DownloadController < ApplicationController
  def index
  end

  def team_info_txt
    time_zone = "Pacific Time (US & Canada)"
    time_format = "%Y%m%d%H%M"
    time = Time.now.in_time_zone(time_zone).strftime(time_format)

    filename = time + '_team_info.txt'
    
    columns = "Team ID,Members,Status"
    content = columns + "\n"
    Team.all.each do |t|
        content << t.id.to_s + ","
        content << "["
        t.users.each do |u|
            content << u.name + " "
        end
        content << "]" + ","
        content << t.approved.to_s
        content << "\n"
    end
      
    send_data(content, :filename => filename)
    
  end
end
