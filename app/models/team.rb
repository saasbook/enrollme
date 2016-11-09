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
    
    def eligible?
        self.users.count == 5 or self.users.count == 6 ? true : false
    end
end