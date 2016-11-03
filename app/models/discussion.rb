class Discussion < ActiveRecord::Base
    has_many :teams
    belongs_to :application
    
    
    
    def can_take_team(team)
        if (team.users.length + count_students <= self.capacity)
           return true 
        else
            return false
        end
    end
    
    def count_students
        @total_students = 0
        self.teams.each do |team|
            @total_students += team.users.length
        end
        
        self.seats_open = self.capacity - @total_students
        
        return @total_students
    end
    
    def added_team_script
        self.count_students
    end

end