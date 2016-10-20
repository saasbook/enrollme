class Team < ActiveRecord::Base
    
    has_many :user
    
    attr_accessor :approve, :comment
    
    
    
end
