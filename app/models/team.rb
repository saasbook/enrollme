class Team < ActiveRecord::Base
    has_many :users
    has_one :submission
    validates :passcode, uniqueness: true
    attr_accessor :num_pending_requests, :declared, :request
  

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
            #EmailStudents.submit_email(user).deliver_later
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
    
    def getMembers # returns the names of all members in the group, to be displayed in proper format in the team listings table
        names = ''
        self.users.each do |u|
          if names == ''
              names = u.name # not sure if this is proper way to call user name
          else
              names = names + ', ' + u.name
          end
      end
      return names
    end
    
    def getMembersNamesArray
         names = []
         self.users.each{|user| names.push(user.name)}    
         return names
    end
    
    def getMembersTimeCommitmentArray
        times = []
        self.users.each{|user| times.push(user.time_commitment)}
        return times
    end
    
    def getMembersBioArray
         bios = []
         self.users.each{|user| bios.push(user.bio)}    
         return bios
    end
    
    def getMembersFacebookArray
         fbs = []
         self.users.each{|user| fbs.push(user.facebook)}    
         return fbs
    end
    
    def getMembersLinkedinArray
         lks = []
         self.users.each{|user| lks.push(user.linkedin)}    
         return lks
    end    
    
    def getMembersExperiencesArray
         exps = []
         self.users.each{|user| exps.push(user.experience)}    
         return exps
    end
    
    def getMembersEmailsArray
         emails = []
         self.users.each{|user| emails.push(user.email)}    
         return emails
    end    
    
    
    def getNumMembers # returns the number of members in this group
        self.users.count
    end
    # def getMembers
    #      self.users
    # end

    def pending_requests
        @pending_requests = 0
    end

    def self.all_declared
        %w(Yes No)
    end
    
    def declared
        result = true
        self.users.each do |user|
            if user.major != 'DECLARED CS/EECS Major'
                result = false
            end
        end
        if result == true
            @declared = 'Yes'
        else
            @declared = 'No'
        end
    end
    
    # def self.check_declared
    #     if self.declared == true
    #         return 'Yes'
    #     else
    #         return 'No'
    #     end
    # end
    
    # TODO def self.join # implement to return join/leave/invite properly depending on session user's relation to team
    #    return 'Join'
    # end
end
