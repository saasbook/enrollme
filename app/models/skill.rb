# Data for a skill. Skills can be active or inactive
class Skill < ActiveRecord::Base
  has_many :talents
  has_many :users, through: :talents
end
