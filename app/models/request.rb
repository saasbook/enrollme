class Request < ActiveRecord::Base
  #belongs_to :user
  belongs_to :team, foreign_key: "source_id"
  
  validates :source_id, numericality: true
  validates :target_id, numericality: true
  validate :target_cannot_be_own_team, :new_size_cannot_be_too_big, :target_exists
  
  def target_cannot_be_own_team
    if self.target_id == self.source_id
      errors.add(:target, "Target cannot be own team")
    end
  end
  
  def new_size_cannot_be_too_big
    target = Team.find_by(id: self.target_id)
    source = Team.find_by(id: self.source_id)
    if target.getNumMembers + source.getNumMembers > Option.maximum_team_size
      errors.add(:size, "Target cannot accomodate all members")
    end
  end
  
  def target_exists
    if !Team.find_by(id: self.target_id)
      errors.add(:target, "Target does not exist")
    end
  end

  def target_users_list
      return Array.wrap(Team.find(self.target_id).users)
  end

  def join
    target = Team.find_by(id: self.target_id)
    target.users.each do |user|
      user.team_id = self.source_id
      user.save
    end
  end
  
  def showTargets
    Team.find_by(id: self.target_id).getMembers
  end
  
  def showSources
    Team.find_by(id: self.source_id).getMembers
  end

end