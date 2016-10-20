class Team < ActiveRecord::Base
    
    has_many :users
    
    attr_accessor :approve, :passcode
    
    
    
end
