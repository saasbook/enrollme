class Team < ActiveRecord::Base
    has_many :users
    has_one :submission
    
    belongs_to :group # Yonas added this
    
    validates :passcode, uniqueness: true

    def self.generate_hash(length=36)
        return SecureRandom.urlsafe_base64(length, false)
    end
    
    def self.approved_teams
        return Team.where(:approved => true)
    end
    
    def withdraw_submission
        self.submitted = false
        self.save!
    end

    def disapprove
        self.approved = false
        self.submitted = false
        self.save!
    end

    def withdraw_approval
        self.approved = false
        self.save!
    end
    
    def approve_with_discussion(id)
        self.approved = true
        self.discussion_id = id
        self.save!
    end
    
    def send_submission_reminder_email
        self.users.each do |user|
            #EmailStudents.submit_email(user).deliver_later
        end
    end
    
    def eligible?
        users.count.between?(Option.minimum_team_size, Option.maximum_team_size)
    end
    
    
    def self.filter_by(status)
        if status.nil? or status == "Pending | Approved"
            return Team.where(approved: true) + Team.where(approved: false, submitted: true)
        elsif status == "Approved"
            return Team.where(approved: true)
        elsif status == "Pending"
            return Team.where(approved: false, submitted: true)
        elsif status == "Forming"
            return Team.where(approved: false, submitted: false)
        end
        return Team.all.each
    end
    
    def add_submission(id)
        self.update(submitted: true)
        self.submission = Submission.find_by_id id
        self.submission_id = id
        self.save!
    end
    
    def can_join?
      ! passcode.nil?  &&
        ! approved     &&
        users.size < Option.maximum_team_size
    end
    
    def self.approved_teams_from_csv(users_hash)
      approved_teams = []
      unapproved_teams = []
      Team.all.each do |t|
        each_team_user_found = true
        t.users.each do |u|
          if users_hash[u.sid.to_i].nil?
              each_team_user_found = false 
          end
        end
        if each_team_user_found
            approved_teams << t 
        else
            unapproved_teams << t
        end
      end
      return approved_teams, unapproved_teams
    end
    
    def self.add_teams_to_discussions(approved_teams)
      approved_teams.each do |t|
        count, index = 100, false
        team_subm, team_prefs = t.submission, []
        if t.approved || !t.eligible? || team_subm.nil? then next end
        team_prefs << team_subm.disc1id
        team_prefs << team_subm.disc2id
        team_prefs << team_subm.disc3id
        team_prefs.each do |d_id|
          d = Discussion.find_by_id d_id
          if d.count_students < count
            count, index = d.count_students, d.id
          end
        end
        if index then t.approve_with_discussion(index) end
      end
    end
end
