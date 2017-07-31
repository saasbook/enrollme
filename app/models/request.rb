class Request < ActiveRecord::Base
  belongs_to :user
  #belongs_to :team

  def target_users_list
    if self.target_type == "user"
      return Array.wrap(User.find(self.target_id))
    else
      return Team.find(self.target_id).users
    end
  end
end
