class User < ActiveRecord::Base
  belongs_to :team, counter_cache: true
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, \
    format: VALID_EMAIL_REGEX, exclusion: { in: lambda { |u| u.all_admin_emails } }
  validates :major, presence: true
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :waitlisted, presence: true
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
  
  def leave_team
    @team = self.team
    @team.users.delete(self)
    @team.withdraw_submission
    
    if User.where(:team_id => @team.id).length <= 0
      @team.destroy!
    end
  end
  
  def self.user_from_oauth(auth)
    return User.find_by(:email => auth[:info][:email].downcase)
    # query = "%#{" << auth[:info][:email] << "}%"
    # return User.where("email LIKE ?", query).first
  end
  
  def all_admin_emails
    return Admin.pluck(:email)
  end

end