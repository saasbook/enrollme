class User < ActiveRecord::Base
  belongs_to :team
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, \
    format: VALID_EMAIL_REGEX, exclusion: { in: lambda { |u| u.all_admin_emails } }
  validates :major, presence: true
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
  
  def leave_team
    @team = self.team
    @team.users.delete(self)
    self.team = nil
    @team.withdraw_submission
    
    if User.where(:team_id => @team.id).length <= 0
      @team.destroy!
    end
  end
  
  def self.user_from_oauth(auth)
    return User.find_by(:email => auth[:info][:email].downcase)
    # query = "%#{" << auth[:info][:email] << "}%"
    # return User.where("email LIKE ?", query).first
  end
  
  def self.get_all_user_emails(team_id)
    return User.where(:team_id => team_id).pluck(:email)
  end
 
  def all_admin_emails
    return Admin.pluck(:email)
  end
  
  def self.users_from_csv(file)
    users = {}
    CSV.foreach(file.path, headers: true) do |row|
      student = row.to_hash
      # Check for nil entries, skip adding to User db if any found
      if !student['Name'].nil? && !student['Student ID'].nil? &&
         !student['Majors'].nil? && !student['Email Address'].nil?
        if User.exists?({
          :name => student['Name'], 
          :sid => student['Student ID'], 
          :major => student['Majors'], 
          :email => student['Email Address']
          })
          # user doesn't exist in User db, add to not_in_users
          users[student] = true
        end
      end
    end
    return users
  end
  
  def self.import(file)
    csv_users = User.users_from_csv(file)
    approved_teams = Team.approved_teams_from_csv(csv_users)
    Team.add_teams_to_discussions(approved_teams)
  end

end