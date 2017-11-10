# Talents Model
class Talent < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  attr_accessor :enable
end
