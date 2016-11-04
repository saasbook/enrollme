class Team < ActiveRecord::Base
    has_many :users
    belongs_to :application
    
    # THIS IS A TEMPORARY HASH-MAKING FUNCTION. TODO: REPLACE
    @@temp_hash = 1

    def self.generate_hash
        @@temp_hash += 1
        return @@temp_hash
    end
    
    def eligible?
        self.users.count == 5 or self.users.count == 6 ? true : false
    end
end