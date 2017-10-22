class Group < ActiveRecord::Base
    has_one :team # Yonas added this
    has_one :other_team,  class_name: "Team", foreign_key: "team2_id" # Yonas added this
    
    
    def self.has_team(team_id)
        Group.all.each do |group|
            if group.team1_id == team_id or group.team2_id == team_id
                return true
            end
        end
        return false
    end
end
