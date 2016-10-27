class Team < ActiveRecord::Base
    has_many :users
    
    # THIS IS A TEMPORARY HASH-MAKING FUNCTION. TODO: REPLACE
    @@temp_hash = 1

    def self.generate_hash
        @@temp_hash += 1
        return @@temp_hash
    end
end