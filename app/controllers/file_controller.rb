class FileController < ApplicationController
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
        content << "[ "
        t.users.each do |u|
            content << u.name + " "
        end
        content << "]" + ","
        content << (t.approved ? 'Approved' : 'Pending')
        content << "\n"
    end
    send_data(content, :filename => filename)
  end
  
  def upload_discussions_txt
    data = params[:discussions]
    if data.nil? or data.content_type != "text/plain"
      redirect_to admin_path(session[:user_id]), :notice => "File is of wrong format"
    else
      File.open(Rails.root.join('discussion_info.txt'), 'wb') do |f|
        f.write(data.read)
      end
      redirect_to admin_path(session[:user_id]), :notice => "Successfully uploaded file"
    end
  end
  
  
end
