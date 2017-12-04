class User < ActiveRecord::Base
  belongs_to :team
  has_many :talents
  has_many :skills, through: :talents

  serialize :emails_sent

  accepts_nested_attributes_for :talents

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, \
    format: VALID_EMAIL_REGEX, exclusion: { in: lambda { |u| u.all_admin_emails } }
  validates :major, presence: true
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  before_save :downcase_email

  NUM_EMAILS_ALLOWED = 2

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

  def emailed_team?(id)
    !emails_sent.nil? && emails_sent.key?(id)
  end

  def skills_str
    if talents.nil? || talents.length.zero?
      return ''
    end
    skills = []
    talents.each do |talent|
      if !talent.skill.nil? && talent.skill.active
        skill_name = talent.skill.name
        skills << skill_name unless skill_name.nil?
      end
    end
    skills.join(", ") if skills != []
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
    email.downcase!
  end

  def can_email_team(team_id)
    init_emails_sent
    if emails_sent[team_id] < NUM_EMAILS_ALLOWED
      emails_sent[team_id] = emails_sent[team_id] + 1
      return true
    end
    false
  end

  def email_team(team_id)
    init_emails_sent
    emails_sent[team_id] = emails_sent[team_id] + 1
  end

  def init_emails_sent
    self.emails_sent ||= {}
    self.emails_sent.default = 0
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
