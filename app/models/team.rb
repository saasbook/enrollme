class Team < ActiveRecord::Base
    has_many :users
    has_one :submission
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
            EmailStudents.submit_email(user).deliver_later
        end
    end
    
    def eligible?
        self.users.count == 5 or self.users.count == 6 ? true : false
    end
    
    
    def self.filter_by(status)
        if status.nil? or status == "Pending | Approved"
            return Team.where(approved: true) + Team.where(approved: false, submitted: true)
        elsif status == "All"
            return Team.all.each
        elsif status == "Approved"
            return Team.where(approved: true)
        elsif status == "Pending"
            return Team.where(approved: false, submitted: true)
        elsif status == "Forming"
            return Team.where(approved: false, submitted: false)
        end
    end
    
    def add_submission(id)
        self.update(submitted: true)
        self.submission_id = id
        self.save!
    end
end