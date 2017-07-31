class Request < ActiveRecord::Base
  belongs_to :user
  #belongs_to :team
  
  validates :target_type, format: {with: /^(user|team)$/}
  validates :target_id, numericality: true
  validate :target_cannot_be_self, :target_cannot_be_own_team, :new_size_cannot_be_too_big, :target_exists
  
  def target_cannot_be_self
    if self.target_type == "user" && self.target_id == self.user_id
      errors.add(:target, "Target cannot be self")
    end
  end
  
  def target_cannot_be_own_team
    if self.target_type == "team" && self.target_id == self.team_id
      errors.add(:target, "Target cannot be own team")
    end
  end
  
  def new_size_cannot_be_too_big
    if self.target_type == "team"
      target_team = Team.find(self.target_id)
      if target_team.getNumMembers >=6
        errors.add(:size, "Target cannot accomodate another member")
      end
    end
  end
  
  def target_exists
    if self.target_type == "user" && !User.exists?(self.target_id)
      errors.add(:target, "Target user does not exist")
    elsif self.target_type == "team" && !Team.exists?(self.target_id)
      errors.add(:target, "Target team does not exist")
    end
  end

  def target_users_list
    if self.target_type == "user"
      return Array.wrap(User.find(self.target_id))
    else
      return Array.wrap(Team.find(self.target_id).users)
    end
  end
end
