class Team < ActiveRecord::Base
    # team.rb
    has_many :user
    
    attr_accessible :approve, :comment
    
    
    
end

