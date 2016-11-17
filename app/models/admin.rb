class Admin < ActiveRecord::Base
    
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, format: VALID_EMAIL_REGEX
  validates :password, presence: true, length: { maximum: 50 }
  
  def self.admin_from_oauth(auth)
    return Admin.find_by(:email => auth.info.email)
  end

end
