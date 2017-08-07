class Team < ActiveRecord::Base
    has_many :users
    has_many :requests, foreign_key: "source_id"
    has_one :submission

    #validates_inclusion_of :waitlisted, :in => [true, false]
    #validates :waitlisted, inclusion: { in: [ true, false ] }
    attr_accessor :num_pending_requests, :declared, :request

    validate :size_cannot_be_too_big

    @@direct_members = [:name, :time_commitment, :bio, :facebook, :linkedin, :experience, :email, :major, :waitlisted]
    @@foreign_members = [:schedule, :skill_set]

    def size_cannot_be_too_big
        if self.getNumMembers > 6
            errors.add(:size, "The team is already full")
        end
    end

    def self.generate_hash(length=36)
        return SecureRandom.urlsafe_base64(length, false)
    end

    def self.approved_teams
        return Team.where(:approved => true)
    end

    def withdraw_submission
        self.submitted = false
        self.save!
    end

    def disapprove
        self.approved = false
        self.submitted = false
        self.save!
    end

    def withdraw_approval
        self.approved = false
        self.save!
    end

    def approve_with_discussion(id)
        self.approved = true
        self.discussion_id = id
        self.save!
    end

    def send_submission_reminder_email
        self.users.each do |user|
            EmailStudents.submit_email(user).deliver_later
        end
    end

    def eligible?
        users.count.between?(Option.minimum_team_size, Option.maximum_team_size)
    end


    def self.filter_by(status)
        if status.nil? or status == "Pending | Approved"
            return Team.where(approved: true) + Team.where(approved: false, submitted: true)
        elsif status == "Approved"
            return Team.where(approved: true)
        elsif status == "Pending"
            return Team.where(approved: false, submitted: true)
        elsif status == "Forming"
            return Team.where(approved: false, submitted: false)
        end
        return Team.all.each
    end

    def add_submission(id)
        self.update(submitted: true)
        self.submission_id = id
        self.save!
    end

    def can_join?
      ! passcode.nil?  &&
        ! approved     &&
        users.size < Option.maximum_team_size
    end

    # Summer '17 Code
    def method_missing(method_call)
        method_call.match(/members_(.*)s/)
        resource = $1.to_sym
        if @@direct_members.include? resource
            return self.users.map{|user| user.send(resource)}
        else
          raise "no such method"
        end
    end

    def getMembers # returns the names of all members in the group, to be displayed in proper format in the team listings table
        self.users.map {|user| user.name}.join(', ')
    end

    def members_pictures
        pics = []
        self.users.each{|user| pics.push(user.avatar.url(:medium))}
        return pics
    end
    
    def members_pictures_thumb
        pics = []
        self.users.each{|user| pics.push(user.avatar.url(:thumb))}
        return pics
    end
    
    
    def members_schedules
        days = []
        self.users.each{|user| days.push(user.getAvailableDays)}
        return days
    end
    
    def members_skill_sets
        skills = []
        self.users.each{|user| skills.push(user.getSkills)}
        return skills
    end

    def getNumMembers # returns the number of members in this group
        self.users.count
    end

    def pending_requests
        @pending_requests = 0
    end

    def self.all_declared
        %w(Yes No)
    end

    def declared
        return self.users.all?{|user| user.major == 'DECLARED CS/EECS Major'}
    end

    def isFull?
        return self.getNumMembers >= 6
    end

    def update_waitlist
      @waitlisted = true
      self.users.each do |u|
        if  u.waitlisted == false
          @waitlisted = false
        end
      end
      self.waitlisted = @waitlisted
      self.save
    end
end
