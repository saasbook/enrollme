class Talent < ActiveRecord::Base
  belongs_to :user
  has_one :skill
end
