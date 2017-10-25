class Submission < ActiveRecord::Base
    # attr_accessor :team_id
    belongs_to :team
end
