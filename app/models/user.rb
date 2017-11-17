class User < ActiveRecord::Base
  belongs_to :team
  has_many :talents
  has_many :skills, through: :talents

  accepts_nested_attributes_for :talents

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, \
    format: VALID_EMAIL_REGEX, exclusion: { in: lambda { |u| u.all_admin_emails } }
  validates :major, presence: true
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  before_save :downcase_email

  def init_talents
    [].tap do |o|
      Skill.all.each do |skill|
        params = { skill_id: skill.id, user_id: id }
        tlist = Talent.where(params)
        t = tlist[0]
        t = Talent.create!(params) if tlist.length.zero?
        o << t.tap { |sub_t| sub_t.enable ||= true }
      end
    end
  end

  def skills_str
    if talents.nil? || talents.length.zero?
      return ''
    end
    skills = ''
    talents.each do |talent|
      skill_name = talent.skill.name
      skills += skill_name + ', ' unless skill_name.nil?
    end
    skills
  end

  def skill?(skill)
    if talents.length.zero?
      return false
    end
    bool = false
    talents.each do |talent|
      bool = true if talent.skill_id == skill.id
    end
    bool
  end

  def downcase_email
    self.email.downcase!
  end

  def leave_team
    @team = self.team
    @team.users.delete(self)
    self.team = nil
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
