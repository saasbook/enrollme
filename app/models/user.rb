class User < ActiveRecord::Base
  #Associations
  belongs_to :team, counter_cache: true
  has_many :requests
  #has_many :teams, through: :requests

  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "50x50>" }, default_url: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAvVBMVEXp6emIwHDs6uyHwG6Fv2vv7PCDvmiDvmqCvmfs6u3q6umCvmXA17eAvWPR3OaVxYLE2Ly20reeyJKQw3ri5eiuz6Hp6fCYxoiqzZydx5iXxZHb4tuGv3iiyZ6607+SxHzN3MfF19fE2MG91MvC18eszLnS3tTL28210bmbxqG20q3d4+Oax4qvzrGSw5KFvnSDvXzd4u6QwZWIvoejyLGyzsjS3tjY3+6tzMTI2Nyfx6m3062DvYK708a+09b/AYLMAAAIUElEQVR4nO2da18aOxCHySTZG6zcQRQQqICKlqKWntb2fP+PdbIgB28Le0kmid3nnW/87Z+ZzEyuUyoVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFhFAAK+J/pT9zfJA8Dnq/no8p9udUf3z2g07/DPoFLYrjObnF30Xcdx6B7xl3vRnE5WlqsEvqrdN0kkjbyHUuYtybTW8S0VCbCakKXDPhL3QiZzSG/NIdD9uakBPu5R57C6/0W6ZLiyzI7QmRCXJZH3LNJ1eguu+6uTA3xCkpnvBSy0RyOfLL20+rYaTxc2+CoseuUs+jYa+0Pj4ypAPUwx/t7hNQ03IyyaTg59AhrWSwZr9GthVgfd4xhsxmAa5tYnoP2amUEVWk1PhsCNp5ooEU76eULMa8JH86o4XuvnH4J7vAvdgt7Ca5mSfDzswqyQKgRK1WecRL+SMwt+KLFqzlgMTpZyXfRZYrejW9kzsPimQqCQ+GiKxAt5aeI1jhl5sXOmSqBIGhUDoo1fVxBldtC+/hoV1lJq0ViJTf0Btakmyuxw6r5efbyhbhBuCdda/VSxj0bo9lPFPhrh1DUaEVTG0R2039KnsCV1xhSHc6fNiHCHYEJBeK5JIpwrDzNbWENTxvAHqjPFDl1GbC2RBBI20GJEuJI+r49lqSWcAsEIpFu05EQYl9EEEko1KPQbeCYkpKyhOu0gpYotDD/rQ8XFVEhc9PUMfobppIR46G7KUZ1U2BDbTeELTkm6J0R2U6jjDkMRTZHXTvkD7jAUblrBrdw4tpMShlvWwBzbSQl9QB2IoGKz6QgOrsIrdBsSF3V+wbvYgUbYEHUPg394JLZQmA+3hqmwg64v2i9FVBj80KHwGlEhjPBDKaEMMV1ADT8dEkoLhYXCQuHfpVBD4Y2rUEs+RM0WwQq/aCNs+unrUtRJ/l8wt1By3NIkhTDF2v7d444RBWpJFy7qgilM8BWWcRe9V+jTJ+y9fI64AbwFe83bv8YONd5PVIElH3mDFH/vqdRC3j9k19hHariiGwhxuE/Ye8Bwg+umIf6ZoRNUN6VV/HNf/m9MN8V3UuGmT5huGqLrK+FGU/xIGuH/wkv65bmOA6YwR6vcaFfPIWEfbZu0fKnnjDCaEemDrptBgGREXSZEMyJ90HdpBm4xjBhqCaTPCmcIAllPmz4Bv0FYr9F7jbSl/ASf86T3iiXMFF8r0ZXs9/C2Yj+dab/q3FGaFMt/dJsw8lOFuzTuqXYLlqLLM8qGIq2a8WwEbyu64kWprquVb1EkkTK9F9VfwgcqAqprjkARUHvyreiMDRJYCuRL9P41SeBGolRHpWZZcAM/lSiR4l/kSgA/dWWlfkZMSROv4WNJEp2eqa8Kw/lSwjo4Jadc/7M7MUDnNPcFb8ZmRjx/FQef9XOZkZKBmUNwT9Bpk+yr/W51zg0XKCTyddankhlpt4zXFwGlUTWDRkbb50aPwJdA6bJbTuWrlLkDe/RFQDAeHGsa8MJ85d/tc/3LFSkBf9EWhjwukjnhYNKyTt8Gv7RoV0PngLsy5oWDYWD8Q+wHECKHg37osXfGZMwph/ftn1bL2wLCAcftm/uw/IJw+eupfhL4djrnB2xbA8HqZEuU9XxbGsxY8plZEfGy3lGrEVoabQ3+5Dp01E5W+U2orecF+JfforqFLtW98w/nPY9Q79vTAj8iibrs2+4V9nJPkRlhvGTbki5sI2+TvqmtWXOs4DeG0t2+WwYLh5hBDRa3r+cONGxI/439cfPVXNqrTrC2aaD05/3ciPUrUoOqv2i8bXdCPaTpPywaH52ioeWztbTpOQT1j5plsPIlhhmHcb24hKvK0QhBJa4fj9tTvQgArQ8NuPuNvcYst0YoVS7iG365FyOliQPWXw8v3TOnMcszHgEW9ebBhmaUXSqU6M/Z0aUJ5p59yVpoAZ9N+8catlE2VbZe7H9JtGpPveajMGRakcBbl2csSUO6sqpHd2GadK2XOrR5NUvRfxOEvFGvn7RVjXum5PIFPxRjPhBJmtNa1Ev1mEtFfVjXk97SS7xuJYaCCom8kXZ7kDJnSYa1VWxn3GDTQHddG4jfI4W8jcSHlezBmF7gRiR1HEKv67XJatMD2H9m2xr4x6Qy7adXt8F5WEkWeJt9g5cy13EpY86vx8oz9ccuY4y6QlzmVokPUssb/ijjHAJj7o4sZnv732R2EoLvyJcNE8G60mbeMDNRoESJMEO/1ZwQ77uc1N+RdsRCOuFchsRAeSeZHIQSThDzKd7r+emRcNkE5gZbUODe5s0ZLQ3PtKTCzTtdNHkQbnFyDUV/aGqi2ENvc9TgcG68BQVejr5lRieKPdn9FCbm+2gE7Wb10xby0xeZ8TK+v8tPNTzDmomMfctgreFtxIywRpZZRqDhye7MZGlDY0uY2cJ6GYq3qkUmFEZMfXkBhiZPKd5D0/dityVT7EibMWwzYXojWpPs96Qzon0mjHrOpjGhj9JfVDJOCiPCxD4Tipx4n3wWZaUJU3V//mlTObOH9ZIakfesmPi+JzxPqHBh5jbFcdhNMjeFO1vmhe9JVn930JrgSifZg9ha+h5Ign5NMhMGW+NMRKJYs7LXhMne3rfZSUmi9nP83mInTbI6HKx0f2M+jrup5U4qponH3JR/tbLo3sOOuWkLsWG6Epyrwwqtd9Kj7Up1dOaQDD28h8GbljvpscUMmFkv8EgjSB2tR2RDyaGBCI/WD0NClotDw/DCfi89PBAXdi6yvYbdxSuEkY3rpG+hzfiBCJf2B5pIYfxqjY5e1ApwR7Fuyu3a943DiVeo9jlZNNzYJ9w/R6A51AwDRp8h0ETbwa+C6X8PoLH6WPYfXgAAAABJRU5ErkJggg=="
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, \
    format: VALID_EMAIL_REGEX, exclusion: { in: lambda { |u| u.all_admin_emails } }
  validates :major, presence: true
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :waitlisted, inclusion: { in: [ true, false ] }
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

  def getAvailableDays
    days = {"Sunday" => sunday ,"Monday" => monday,"Tuesday"=>tuesday,"Wednesday"=>wednesday,"Thursday"=>thursday,"Friday"=>friday,"Saturday"=>saturday}
    getStringFromCheckBoxes(days)
  end

  def getSkills
    skills = {"Ruby on Rails" => ruby_on_rails, "Other Backend" => other_backend, "Frontend" => frontend, "UI Design" => ui_design, "Team Management" => team_management}
    getStringFromCheckBoxes(skills)
  end
  
  def getStringFromCheckBoxes(hash)
    str = ""
    counter = 0
    hash.each do |key, value|
      if value == 1
        if counter == 0
          str = key
        else
          str = str + ', ' + key
        end
      counter += 1
    end
    end
    # hash.each {|key, value| str = str + key + ", " unless value !=1 }
    str
  end

  def leave_team
    @team = self.team
    @team.users.delete(self)
    @team.update_waitlist
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

  def on_team?
    return team_id == nil
  end

  def getAllTeamMembers
    if !on_team?
      return self.name
    else
      return self.team.getMembers
    end
  end

end
