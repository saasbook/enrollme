# Talents Model
class Talent < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  has_one :skill
end
