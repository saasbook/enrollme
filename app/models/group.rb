class Group < ActiveRecord::Base
    has_one :team # Yonas added this
    has_one :other_team, foreign_key => "team2_id", class_name => "Team" # Yonas added this
end
