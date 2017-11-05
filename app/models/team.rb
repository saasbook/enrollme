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
        Team.all.each do |t|
          each_team_user_found = true
          t.users.each do |u|
            # If User is not in users_hash, then User is not in CSV
            if users_hash[u].nil? then each_team_user_found = false end
          end
          if each_team_user_found then approved_teams << t end
        end
        return approved_teams
    end
    
    def self.add_teams_to_discussions(approved_teams)
      approved_teams.each do |t|
        if !t.approved && t.eligible?
          least_disc = Discussion.disc_with_least
          index = false
          if least_disc.can_take_team?(t)
            index = least_disc.id
          else
            discs = Discussion.valid_discs_for(t)
            discs.each do |d|
              if d.can_take_team?(t) then index = d.id end
            end
          end
          if index then t.approve_with_discussion(index) end
        end
      end
    end

end
