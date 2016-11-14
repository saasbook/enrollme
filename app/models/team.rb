class Team < ActiveRecord::Base
    has_many :users

    # THIS IS A TEMPORARY HASH-MAKING FUNCTION. TODO: REPLACE
    @@temp_hash = 1

    def self.generate_hash
        @@temp_hash += 1
        return @@temp_hash
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
end