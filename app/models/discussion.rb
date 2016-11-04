class Discussion < ActiveRecord::Base
    has_many :teams
    belongs_to :application
    
    
    
    def can_take_team?(team)
        if (team.users.length + count_students <= self.capacity)
           return true 
        else
            return false
        end
    end
    
    def is_full?
       if (count_students >= capacity)
           return true
       else
           return false
       end
    end
    
    def seats_open
        return self.capacity - count_students
    end
    
    def count_students
        @total_students = 0
        self.teams.each do |team|
            @total_students += team.users.length
        end
        
        return @total_students
    end
    
    def added_team_script
        self.count_students
    end
    
    def self.all_valid_disc(team)
        retVal = []
        Discussion.all.each do |disc|
             if (disc.can_take_team?(team))
                retVal << disc 
             end
        end
        
        return retVal
    end

end