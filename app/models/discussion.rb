class Discussion < ActiveRecord::Base
    has_many :teams
    
    validates :number, presence: true, uniqueness: true, length: { maximum: 5, minimum: 5 }, format: /[0-9]{5}/
    
    def can_take_team?(team)
        return !!(team.users.length + count_students <= self.capacity)
    end
    
    def is_full?
       return !!(count_students >= capacity)
    end
    
    def seats_open
        retVal = self.capacity - count_students
        if retVal >= 0
            return retVal
        else
            return 0
        end
    end
    
    def count_students
        num_students = 0
        self.teams.each do |team|
            num_students += team.users.length
        end
        return num_students
    end
    
    
    def self.valid_discs_for(team)
        discs = []
        Discussion.all.each do |disc|
            discs << disc if (disc.can_take_team?(team))
        end
        return discs
    end
    
    def self.disc_with_least
        least_count = 100 # temp max
        least_disc = false
        Discussion.all.each do |disc|
            disc_num_students = disc.count_students
            if least_count > disc_num_students
                least_count = disc_num_students
                least_disc = disc
            end
        end
        return least_disc    
    end
    
    def info
        return "CCN: #{self.number} | Time: #{self.day} #{self.time} | Enrolled: #{self.count_students} / #{self.capacity}"
    end

end